# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper

	def table(collection, headers, options = {}, &proc)
		options.reverse_merge!({:class => 'list',	:border => 0,	:width => '100%', :include_action => true })
		
		output = "<table class=\"#{options[:class]}\" border=\"#{options[:border].to_s}\" width=\"#{options[:width]}\" >\n"
		output << "<thead>\n\t"
		output << content_tag("tr", headers.collect { |h| content_tag("th", h) } << (content_tag("th", "", :width => 150) if options[:include_action])) << "\n\t"
		output << "\n</thead>\n<tbody>"
		concat(output, proc.binding)
		collection.each { |row|	proc.call(row) }
		concat("\n</tbody>\n</table>\n", proc.binding)
	end	

	def display_flashes
		if flash.size != 0
			flashes = '<div id="flash">'
			flash.each_pair  do |key, value|
			  flashes += content_tag(:div, content_tag(:span, value), :class => key)
			end
			flashes += '</div>'
		end
		flashes
	end
	
	def flexigrid(url, options = {}, &proc)
		options.reverse_merge!(:method => 'get', :usepager => true, 'useRp' => true, :rp => 15, 'showTableToggleBtn' => true, :height => 300)
		columns = []; search_itens = []
		
		proc.call columns, search_itens
		
		output = {:url => url_for(url+'.json'), 'colModel' => columns, 'searchitems' => search_itens, :method => options[:method], 'dataType' => 'json', 'useRp' => options[:useRp], :rp => options[:rp], 'showTableToggleBtn' => options['showTableToggleBtn'], :usepager => options[:usepager], :sortname => options[:sortname], :sortorder => 'desc', :height => options[:height]}
		
		output[:sortname] = options[:sortname] if options[:sortname]
		output[:sortorder] = options[:sortorder] if options[:sortorder]
		output[:title] = options[:title] if options[:title]
		
		concat("$('#flexigrid').flexigrid("+output.to_json+");", proc.binding)
	end

end
