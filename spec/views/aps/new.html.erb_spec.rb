require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/aps/new.html.erb" do
  include ApsHelper
  
  before(:each) do
    @ap = mock_model(Ap)
    @ap.stub!(:new_record?).and_return(true)
    @ap.stub!(:essid).and_return("MyString")
    @ap.stub!(:mac).and_return("MyString")
    @ap.stub!(:enc).and_return("MyString")
    @ap.stub!(:key).and_return("MyString")
    @ap.stub!(:ip).and_return("MyString")
    @ap.stub!(:mask).and_return("MyString")
    @ap.stub!(:dhcp).and_return(false)
    @ap.stub!(:channel).and_return("1")
    @ap.stub!(:pais).and_return()
    @ap.stub!(:cidade).and_return()
    @ap.stub!(:estado).and_return()
    assigns[:ap] = @ap
  end

  it "should render new form" do
    render "/aps/new.html.erb"
    
    response.should have_tag("form[action=?][method=post]", aps_path) do
      with_tag("input#ap_essid[name=?]", "ap[essid]")
      with_tag("input#ap_mac[name=?]", "ap[mac]")
      with_tag("input#ap_enc[name=?]", "ap[enc]")
      with_tag("input#ap_key[name=?]", "ap[key]")
      with_tag("input#ap_ip[name=?]", "ap[ip]")
      with_tag("input#ap_mask[name=?]", "ap[mask]")
      with_tag("input#ap_dhcp[name=?]", "ap[dhcp]")
      with_tag("input#ap_channel[name=?]", "ap[channel]")
      with_tag("input#ap_pais[name=?]", "ap[pais]")
      with_tag("input#ap_cidade[name=?]", "ap[cidade]")
      with_tag("input#ap_estado[name=?]", "ap[estado]")
    end
  end
end


