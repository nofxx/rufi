# require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
# 
# describe "/logfiles/edit.html.erb" do
#   include LogfilesHelper
#   
#   before(:each) do
#     assigns[:logfile] = @logfile = stub_model(Logfile,
#       :new_record? => false,
# #      :type => "value for type",
#       :state => "value for state",
#       :source_content_type => "value for source_content_type",
#       :source_file_name => "value for source_file_name",
#       :source_file_size => "1",
#       :note => "value for note"
#     )
#   end
# 
#   it "should render edit form" do
#     render "/logfiles/edit.html.erb"
#     
#     response.should have_tag("form[action=#{logfile_path(@logfile)}][method=post]") do
#       with_tag('input#logfile_type[name=?]', "logfile[type]")
#       with_tag('input#logfile_state[name=?]', "logfile[state]")
# #      with_tag('input#logfile_source_content_type[name=?]', "logfile[source_content_type]")
#       with_tag('input#logfile_source_file_name[name=?]', "logfile[source_file_name]")
#       with_tag('input#logfile_source_file_size[name=?]', "logfile[source_file_size]")
#       with_tag('textarea#logfile_note[name=?]', "logfile[note]")
#     end
#   end
# end
# 
# 
