class Regexp
	def each_match(str)
	     	#start = 0
		text =""
	   	#while matchdata = self.match(str, start)
	   	while match_data = self.match(str)
	   		text << match_data.pre_match	
		     	yield text, match_data
		      	#start = matchdata.end(0)
		      	str = match_data.post_match
		end
		text << str
	end
end

module ApplicationHelper

	def escape_precode(str)
		return  if str.empty?
		pattern = %r{(<pre\s*[^>]*>)(\s*)(<code\s*[^>]*>)?(.*?)(</code>)?(\s*)(</pre>)}im
		return pattern.each_match(str) do |text,match_data| 
			if match_data.length == 8 
				text << handle_match8(match_data)
			elsif match_data.length == 6
				text << thandle_match6(match_data)
			end
		end	
	end

	protected
	def handle_match6(match_data)
		#return  "" if match_data.nil? or match_data.length != 6
		rt = "#{match_data[1]}#{match_data[2]}"
		rt << match_data[3].gsub(/</,'&lt;').gsub(/>/,'&gt;')
		rt << "#{match_data[4]}#{match_data[5]}"
	end

	def handle_match8(match_data)
		rt = "#{match_data[1]}#{match_data[2]}#{match_data[3]}"
		rt << match_data[4].gsub(/</,'&lt;').gsub(/>/,'&gt;')
		#rt << begin match_data[4].gsub!(/</,'&lt;').gsub!(/>/,'&gt;'); rescue  => ex;ex.message; end
		rt << "#{match_data[5]}#{match_data[6]}#{match_data[7]}"
	end

end
