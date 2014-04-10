def caesar_cipher(string,num)
	string.each_byte { |i|
		case i when (65..90),(97..122) then offset = i + num
		(offset > 90 && offset < 97 || offset > 122 ? offset = offset - 26 : nil) else offset = i end
		print output_coded(offset.chr) }
end

def decaesar_cipher(string,num)
	string.each_byte { |i|
		case i when (65..90),(97..122) then offset = i - num
		(offset > 90 && offset < 97 || offset < 65 ? offset = offset + 26 : nil) else offset = i end
		print output_decoded(offset.chr) }
end

def output_coded(code)
	Dir.mkdir('coded') unless Dir.exists? 'coded'

	file = 'coded/coded.txt'

	File.open(file, 'a') do |f|
		f.print code
	end
end

def output_decoded(code)
	Dir.mkdir('decoded') unless Dir.exists? 'decoded'
	file = 'decoded/decoded.txt'

	File.open(file, 'a') do |f|
		f.print code
	end
end

def input_code(text,offset)
	File.open("#{text}.txt").each { |line| caesar_cipher(line, offset)}
end

def input_decode(text,offset)
	File.open("coded/#{text}.txt").each { |line| decaesar_cipher(line, offset)}
end

loop do
	puts 'What would you like to do?'
	puts '--Code : Code file'
	puts '--Decode : Decode file'
	puts '--Close : Closes application'
	answer = gets.chomp.downcase
	case answer
		when 'code'
			print 'Type your file name: '
			filename = gets.chomp.downcase
			print 'Type your offset number: '
			offset = gets.chomp.to_i
			if offset.is_a? Integer
			input_code(filename, offset)
			puts "\n\nCoded Successfully"
			else
				puts "\nYour offset is not an Integer"
				puts"\nYou text was not coded Successfully"
			end
		when 'decode'
			print 'Type your file name: '
			filename = gets.chomp.downcase
			print 'Type your offset number: '
			offset = gets.chomp.to_i
			if offset.is_a? Integer
				input_decode(filename, offset)
				puts "\n\nDecoded Successfully"
			else
				puts "\nYour offset is not an Integer"
				puts"\nYou text was not decoded Successfully"
			end
		when 'close'
			puts 'Good bye!'
			break
		else
			puts 'I dont understand'
	end
	puts "\n\n"
end