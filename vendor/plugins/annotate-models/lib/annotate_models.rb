require "config/environment"

MODEL_DIR   = File.join(RAILS_ROOT, "app/models")
SPEC_MODEL_DIR  = File.join(RAILS_ROOT, "spec/models")
FIXTURE_DIR = File.join(RAILS_ROOT, "#{ENV['FIXTURES'] ? ENV['FIXTURES'] : "test"}/fixtures")
SORT_COLUMNS = ENV['SORT'] ? ENV['SORT'] != 'no' : true

module AnnotateModels

  PREFIX = "== Schema Info"
  
  # Simple quoting for the default column value
  def self.quote(value)
    case value
      when NilClass                 then "NULL"
      when TrueClass                then "TRUE"
      when FalseClass               then "FALSE"
      when Float, Fixnum, Bignum    then value.to_s
      # BigDecimals need to be output in a non-normalized form and quoted.
      when BigDecimal               then value.to_s('F')
      else
        value.inspect
    end
  end

  # Use the column information in an ActiveRecord class
  # to create a comment block containing a line for
  # each column. The line contains the column name,
  # the type (and length), and any optional attributes
  def self.get_schema_info(klass, header)
    info = "# #{header}\n#\n"
    info << "# Table name: #{klass.table_name}\n#\n"
    
    max_size = klass.column_names.collect{|name| name.size}.max + 1
    if SORT_COLUMNS
        pk    = klass.columns.find_all { |col| col.name == klass.primary_key }.flatten
        assoc = klass.columns.find_all { |col| col.name.match(/_id$/) }.sort_by(&:name)
        dates = klass.columns.find_all { |col| col.name.match(/_on$/) }.sort_by(&:name)
        times = klass.columns.find_all { |col| col.name.match(/_at$/) }.sort_by(&:name)

        pk + assoc + (klass.columns - pk - assoc - times - dates).compact.sort_by(&:name) + dates + times
      else
        klass.columns
      end.each { |col| info << annotate_column(col, klass, max_size) }

    info << "#\n\n"
  end
  
  def self.annotate_column(col, klass, max_size)
      attrs = []
      attrs << "default(#{quote(col.default)})" if col.default
      attrs << "not null" unless col.null
      attrs << "primary key" if col.name == klass.primary_key

      col_type = col.type.to_s
      if col_type == "decimal"
        col_type << "(#{col.precision}, #{col.scale})"
      else
        col_type << "(#{col.limit})" if col.limit
      end 
      sprintf("#  %-#{max_size}.#{max_size}s:%-15.15s %s\n", col.name, col_type, attrs.join(", "))
  end

  # Add a schema block to a file. If the file already contains
  # a schema info block (a comment starting
  # with "Schema as of ..."), remove it first.
  # Mod to write to the end of the file

  def self.annotate_one_file(file_name, info_block)
    if File.exist?(file_name)
      content = File.read(file_name)

      # Remove old schema info
      content.sub!(/^# #{PREFIX}.*?\n(#.*\n)*\n/, '')

      # Write it back
      File.open(file_name, "w") do |f| 
        f.puts ENV['POSITION'] == 'top' ?  info_block + content : content + "\n" + info_block 
      end
    end
  end
  
  # Given the name of an ActiveRecord class, create a schema
  # info block (basically a comment containing information
  # on the columns and their types) and put it at the front
  # of the model and fixture source files.

  def self.annotate(klass, header)
    info = get_schema_info(klass, header)
    
    model_file_name = File.join(MODEL_DIR, klass.name.underscore + ".rb")
    annotate_one_file(model_file_name, info)
    
    rspec_model_file_name = File.join(RSPEC_MODEL_DIR, klass.name.underscore + "_spec.rb")
    annotate_one_file(rspec_model_file_name, info)

    fixture_file_name = File.join(FIXTURE_DIR, klass.table_name + ".yml")
    annotate_one_file(fixture_file_name, info)
  end

  # Return a list of the model files to annotate. If we have 
  # command line arguments, they're assumed to be either
  # the underscore or CamelCase versions of model names.
  # Otherwise we take all the model files in the 
  # app/models directory.
  def self.get_model_names
    models = ENV['MODELS'] ? ENV['MODELS'].split(',') : []
    
    if models.empty?
      Dir.chdir(MODEL_DIR) do 
        models = Dir["**/*.rb"]
      end
    end
    models
  end

  # We're passed a name of things that might be 
  # ActiveRecord models. If we can find the class, and
  # if its a subclass of ActiveRecord::Base,
  # then pas it to the associated block

  def self.do_annotations
    header = PREFIX.dup
    version = ActiveRecord::Migrator.current_version rescue 0
    if version > 0
      header << "\n# Schema version: #{version}"
    end

    annotated = []
    self.get_model_names.each do |m|
      class_name = m.sub(/\.rb$/,'').camelize
      begin
        klass = class_name.split('::').inject(Object){ |klass,part| klass.const_get(part) }
        if klass < ActiveRecord::Base && !klass.abstract_class?
          annotated << class_name
          self.annotate(klass, header)
        end
      rescue Exception => e
        puts "Unable to annotate #{class_name}: #{e.message}"
      end
      
    end
    puts "Annotated #{annotated.join(', ')}"
  end
end
