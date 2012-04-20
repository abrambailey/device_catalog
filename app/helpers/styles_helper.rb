module StylesHelper

  def optcutter(options)
		cutopts = YAML.load(options).reject(&:empty?)
		@opts = ['<ul>']
 		cutopts.each do |x|
 			@opts.push("<li type=square>#{x}</li>")
		end
		@opts.push('</ul>')
		return @opts
  end
end
