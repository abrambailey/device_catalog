module StylesHelper

  def optcutter(options)
  	cutopts = options.scan(/\w+/)
 		@opts = ""
 		cutopts.each do |x|
 			@opts = @opts+"#{x} "
		end
  return @opts
  end
end
