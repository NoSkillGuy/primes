primes = []
two_numbers = gets.chomp().split().map(&:to_i)
if two_numbers[0] < 3
	primes.push two_numbers[0]
end
(two_numbers[0]...two_numbers[1]).each do |n|
	if n.odd?
		n_is_a_prime = true
		square_root = Integer.sqrt(n)
		(3..square_root).each do |d|
			next if d.even?
			n_is_a_prime = false if n%d == 0
		end
		primes.push n if n_is_a_prime
	end
end