module StylesHelper

  def optcutter(options)
  	cutopts = options.scan(/\w+/)
 		@opts = ""
 		cutopts.each do |x|
 			@opts = @opts+"<b>#{x}</b> <br />"
		end
  return @opts
  end
end
