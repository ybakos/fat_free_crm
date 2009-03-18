require File.expand_path(File.dirname(__FILE__) + '/../../spec_helper')

describe "/campaigns/new.html.erb" do
  include CampaignsHelper
  
  before(:each) do
    @current_user = Factory(:user)
    assigns[:campaign] = Campaign.new(:user => @current_user)
    assigns[:users] = [ @current_user ]
    assigns[:current_user] = @current_user
  end
 
  it "create: should render [new.html.haml] template into :create_campaign div" do
    params[:cancel] = nil
    render "campaigns/new.js.rjs"
    
    response.should have_rjs("create_campaign") do |rjs|
      with_tag("form[class=new_campaign]")
    end
  end

end

