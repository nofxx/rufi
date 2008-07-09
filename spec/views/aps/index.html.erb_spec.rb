# require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')
# 
# describe "/aps/index.html.erb" do
#   include ApsHelper
#   
#   before(:each) do
#     ap_98 = mock_model(Ap)
#     ap_98.should_receive(:essid).and_return("MyString")
#     ap_98.should_receive(:mac).and_return("MyString")
#     ap_98.should_receive(:enc).and_return("MyString")
#     ap_98.should_receive(:key).and_return("MyString")
#     ap_98.should_receive(:ip).and_return("MyString")
#     ap_98.should_receive(:mask).and_return("MyString")
#     ap_98.should_receive(:dhcp).and_return(false)
#     ap_98.should_receive(:channel).and_return("1")
#     ap_98.should_receive(:country).and_return(1)
#     ap_98.should_receive(:city).and_return(1)
#     ap_98.should_receive(:region).and_return(1)
#     ap_99 = mock_model(Ap)
#     ap_99.should_receive(:essid).and_return("MyString")
#     ap_99.should_receive(:mac).and_return("MyString")
#     ap_99.should_receive(:enc).and_return("MyString")
#     ap_99.should_receive(:key).and_return("MyString")
#     ap_99.should_receive(:ip).and_return("MyString")
#     ap_99.should_receive(:mask).and_return("MyString")
#     ap_99.should_receive(:dhcp).and_return(false)
#     ap_99.should_receive(:channel).and_return("1")
#     ap_99.should_receive(:country).and_return(1)
#     ap_99.should_receive(:city).and_return(1)
#     ap_99.should_receive(:region).and_return(1)
# 
#     assigns[:aps] = [ap_98, ap_99]
#   end
# 
#   it "should render list of aps" do
#     render "/aps/index.html.erb"
#     response.should have_tag("tr>td", "MyString", 2)
#     response.should have_tag("tr>td", "MyString", 2)
#     response.should have_tag("tr>td", "MyString", 2)
#     response.should have_tag("tr>td", "MyString", 2)
#     response.should have_tag("tr>td", "MyString", 2)
#     response.should have_tag("tr>td", "MyString", 2)
#     # response.should have_tag("tr>td", false, 2)
#     response.should have_tag("tr>td", "1", 2)
#     # response.should have_tag("tr>td", "1", 2)
#     # response.should have_tag("tr>td", "1", 2)
#     # response.should have_tag("tr>td", "1", 2)
#   end
# end    

