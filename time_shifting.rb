puts "What is the source file *.srt?"
file_name = gets.chomp
file_shifted = file_name.sub(/\./,'_shifted.')
shift = Random.new.rand(9999)
File.new(file_shifted, "w")
file_contents = IO.read(file_name)
file_contents = file_contents.gsub(/^\d+\s\d+:\d{2}:\d{2},\d+\D+\d+:\d{2}:\d{2},\d+/) do |times|
	times = times.gsub(/\d+:\d{2}:\d{2},\d+/) do |time|
		add_minutes = 0
		time = time.gsub(/\d{2},\d+/) do |seconds|
			seconds = seconds.sub(/,/,'').to_i
			seconds += shift
			if seconds >= 60000
				add_minutes = seconds / 60000
				seconds %= 60000
			end
			if seconds >= 1000
				seconds = seconds.to_s.sub(/(\d{3}$)/,',\1')
			elsif seconds >= 100
				seconds = seconds.to_s.sub(/(\d{3}$)/,'0,\1')
			elsif seconds >= 10
				seconds = seconds.to_s.sub(/(\d{2}$)/,'0,0\1')
			else
				seconds = seconds.to_s.sub(/(\d)/,'0,00\1')
			end
		end
		if add_minutes > 0
			add_hours = 0
			time = time.sub(/:\d{2}:/) do |minutes|
				minutes = minutes.gsub(/:/,'').to_i
				minutes += add_minutes
				if minutes >= 60
					add_hours = minutes / 60
					minutes %= 60
				end
				minutes = minutes.to_s.sub(/(.+)/,':\1:')
			end
			if add_hours > 0
				time = time.sub(/^\d+/) do |hours|
					hours = hours.to_i
					hours += add_hours
					hours = hours.to_s
				end
			end
		end
		time = time
	end
	times = times
end
IO.write(file_shifted, file_contents, mode:'a')