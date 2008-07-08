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
	
	def flexgrid(collection, )
	
	end

end
