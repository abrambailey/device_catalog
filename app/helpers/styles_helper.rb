module StylesHelper

  def optcutter(style)
		cutopts = YAML.load(style.options).reject(&:empty?)
		@opts = ["<b>Battery Size:</b> #{style.battery}<br />"]
		@opts.push("<b>Programs:</b> #{style.programs}<br />")
		@opts.push("<b>Channels:</b> #{style.channels}<br />")
		@opts.push('<b>Options</b><ul>')
 		cutopts.each do |x|
 			@opts.push("<li type=square>#{x}</li>")
		end
		@opts.push('</ul>')
		return @opts
  end
end
