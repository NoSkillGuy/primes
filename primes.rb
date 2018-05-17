def prime_function
	primes = []
	# two_numbers = gets.chomp().split().map(&:to_i)
	last_prime_detected = File.read('primes.txt').split(',').last.to_i
	two_numbers = [last_prime_detected+1,last_prime_detected+100000]
	if two_numbers[0] < 3
		primes.push two_numbers[0]
	end
	st = Time.now()
	fn = two_numbers[0]
	(two_numbers[0]...two_numbers[1]).each do |n|
		if n % 10000 == 0
			et = Time.now()
			ln = n
			puts "For 10000 numbers #{fn}-#{ln} the script took #{et-st} seconds"
			st = Time.now()
			fn = ln
		end 
		if n.odd?
			n_is_a_prime = true
			square_root = Integer.sqrt(n)
			(3..square_root).each do |d|
				next if d.even?
				n_is_a_prime = false if n%d == 0
			end
			primes.push n if n_is_a_prime
			File.open('primes.txt', 'a') { |file| file.write("#{n},") } if n_is_a_prime
		end
	end
	`git add .`
	`git commit -m 'prime numbers added'`
	`git push origin master`
	prime_function
end

prime_function