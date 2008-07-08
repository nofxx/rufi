module ActionView
  module Helpers
    module AssetTagHelper
      
      # Creates a script tag which loads the correct Javascript file (if one exists) according to the Rails view template conventions
      # For example if you're on the users controllers show action, it tries to load app/views/users/show.js.erb
      def js_erb_auto_include_tag
        file = File.join(RAILS_ROOT, "app", "views", controller.controller_name, "#{controller.action_name}.js.erb")
        if File.exist?(file)
        	content_tag 'script', '', :src => @js_erb_auto_include_url, :type => 'text/javascript'    
        end
      end
      
    end
  end
end

module JsErbAutoInclude
  
  def self.included(base)
    base.extend(ClassMethods)
    base.send(:include, InstanceMethods)
  end
      
  module InstanceMethods
    private
    
    # Sets up the necessary variables fot the js_erb_auto_include_tag view helper.
    def js_erb_auto_include
      @js_erb_auto_include_url = url_for(request.path_parameters.merge({ :format => 'js' }))
    end
  end
  
  module ClassMethods
    
    # Use this convenience method in your controllers (or application controller) to activate auto inclusion for the controller.
    def activate_js_erb_auto_include  
      before_filter :js_erb_auto_include
    end
  end
  
end