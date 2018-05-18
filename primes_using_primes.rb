def prime_function primes_data
	primes = []
	# two_numbers = gets.chomp().split().map(&:to_i)
	last_prime_detected = primes_data.last
	p last_prime_detected
	two_numbers = [last_prime_detected+1,last_prime_detected+200000]
	p two_numbers
	# if two_numbers[0] < 3
	# 	primes.push two_numbers[0]
	# end
	st = Time.now()
	fn = two_numbers[0]
	needed_primes_data = []
	sqrt_last_prime_detected = Integer.sqrt(last_prime_detected)
	primes_data.each do |pd|
		if pd < sqrt_last_prime_detected
			needed_primes_data.push pd
		end
	end

	(two_numbers[0]...two_numbers[1]).each do |n|
		if n % 10000 == 0
			et = Time.now()
			ln = n
			puts "For 10000 numbers #{fn}-#{ln} the script took #{et-st} seconds"
			st = Time.now()
			fn = ln
			# sleep(5)
		end 
		if n.odd?
			n_is_a_prime = true
			square_root = Integer.sqrt(n)

			# (3..square_root).each do |d|
			# 	next if d.even?
			# 	n_is_a_prime = false if n%d == 0
			# end
			# index_of_last_element_in_needed_primes_data = needed_primes_data.size -1
			while primes_data[needed_primes_data.size] < square_root
				needed_primes_data.push primes_data[needed_primes_data.size]
			end
			
			needed_primes_data.each do |p|
				# if p <= square_root
					if n%p == 0
						n_is_a_prime = false
						break
					end
				# end
			end
			primes.push n if n_is_a_prime
			File.open('primes1.txt', 'a') { |file| file.write("#{n},") } if n_is_a_prime
		end
	end

	require 'erb'
	erb_file = 'README.md.erb'
	md_file = File.basename(erb_file, '.erb')

	erb_str = File.read(erb_file)
	primes_data = File.read('primes1.txt').split(',')
	@primes_search_completed_status = two_numbers[1]
	@primes_detected = primes_data.count
	@largest_prime_detected = primes_data.last
	renderer = ERB.new(erb_str)
	result = renderer.result()
	File.open(md_file, 'w') do |f|
	  f.write(result)
	end

	system("git add .")
	system("git commit -m 'prime numbers added'")
	system("git push origin master")
	sleep 20
	prime_function primes_data
end

primes_data = File.read('corrected_primes.txt').split(',').map(&:to_i)
prime_function primes_data
