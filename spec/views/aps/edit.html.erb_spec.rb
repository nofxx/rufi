require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/aps/edit.html.erb" do
  include ApsHelper
  
  before do
    @ap = mock_model(Ap)
    @ap.stub!(:essid).and_return("MyString")
    @ap.stub!(:mac).and_return("MyString")
    @ap.stub!(:enc).and_return("MyString")
    @ap.stub!(:key).and_return("MyString")
    @ap.stub!(:ip).and_return("MyString")
    @ap.stub!(:mask).and_return("MyString")
    @ap.stub!(:dhcp).and_return(false)
    @ap.stub!(:channel).and_return("1")
    @ap.stub!(:pais_id).and_return(1)
    @ap.stub!(:cidade_id).and_return(1)
    @ap.stub!(:estado_id).and_return(1)
    assigns[:ap] = @ap
  end

  it "should render edit form" do
    render "/aps/edit.html.erb"
    
    response.should have_tag("form[action=#{ap_path(@ap)}][method=post]") do
      with_tag('input#ap_essid[name=?]', "ap[essid]")
      with_tag('input#ap_mac[name=?]', "ap[mac]")
      with_tag('input#ap_enc[name=?]', "ap[enc]")
      with_tag('input#ap_key[name=?]', "ap[key]")
      with_tag('input#ap_ip[name=?]', "ap[ip]")
      with_tag('input#ap_mask[name=?]', "ap[mask]")
      with_tag('input#ap_dhcp[name=?]', "ap[dhcp]")
      with_tag('input#ap_channel[name=?]', "ap[channel]")
      with_tag('input#ap_pais[name=?]', "ap[pais]")
      with_tag('input#ap_cidade[name=?]', "ap[cidade]")
      with_tag('input#ap_estado[name=?]', "ap[estado]")
    end
  end
end


