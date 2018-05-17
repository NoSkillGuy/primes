primes_data = File.read('primes.txt').split(',')
puts "Number of primes detected are #{primes_data.count}"
puts "Largest prime detected is #{primes_data.last}"