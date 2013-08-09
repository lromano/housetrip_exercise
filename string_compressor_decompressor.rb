class StringCompressor
	attr_reader :initial_string
	attr_accessor :result_string

	def initialize(initial_string)
		@initial_string = initial_string
		@result_string = ""
	end
	
	def compress
		char_count = 1
		initial_string.each_char.each_with_index do |current_char, index|
			if next_char(index) == current_char
				char_count += 1
			else
				self.result_string += char_count == 1 ? current_char : "#{current_char}#{char_count}"
				char_count = 1
			end
		end
		result_string
	end

	private
	def next_char(index)
		initial_string[index+1]
	end
end


class StringDecompressor
	attr_reader :initial_string
	attr_accessor :result_string

	def initialize(initial_string)
		@initial_string = initial_string
		@result_string = ""
	end

	def decompress
		initial_string.each_char.each_with_index do |char, index|
			next if char =~ /^\d+$/	
			self.result_string += if initial_string[index+1] =~ /^\d+$/
				char * initial_string[index+1].to_i
			else
				char
			end
		end
		result_string
	end
end

