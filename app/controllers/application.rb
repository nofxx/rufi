# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
  helper :all # include all helpers, all the time       
  # 
  # 
  # Be sure to include AuthenticationSystem in Application Controller instead
  include AuthenticatedSystem
                              
  before_filter :login_required 
  # See ActionController::RequestForgeryProtection for details
  # Uncomment the :secret if you're not using the cookie session store
  protect_from_forgery :secret => '4008a843b7f2120eb3e66893063f1ba9'
  
  # See ActionController::Base for details 
  # Uncomment this to filter the contents of submitted sensitive data parameters
  # from your application log (in this case, all fields with names like "password"). 
  # filter_parameter_logging :password
  
  activate_js_erb_auto_include
  
  def flexigrid_paginate(model_class, select, params)

  	page = params[:page] ? params[:page].to_i : 1
  	rp = params[:rp] ? params[:rp] .to_i : 15
  	query = params[:query]
  	qtype = params[:qtype]
  	sortname = params[:sortname]
  	sortorder = params[:sortorder] ? params[:sortorder] : 'desc'
  	
  	start = ((page - 1) * rp).to_i
  	query = '%'+query+'%'
  	
  	if query == '%%'                                 
  	  puts select
  		@collection = model_class.all :select => select.join(','), :order => sortname+' '+sortorder, :limit => rp, :offset => start
  		count = model_class.count
  	else
			@collection = model_class.all :select => select.join(','), :order => sortname+' '+sortorder, :limit => rp, :offset => start, :conditions => [qtype+' like ?', query]			
  		count = model_class.count :conditions => [qtype+' like ?', query]
  	end
  	
  	output = {}
  	output[:page] = page
  	output[:total] = count
  	output[:rows] = @collection.map { |c| { :cell => select.map { |s| c[s] }}}
  	output
  
  end
  
end
