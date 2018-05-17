number_to_be_checked = gets.chomp().split()[0].to_i
primes_data = File.read('primes.txt').split(',')
puts primes_data.include? number_to_be_checked