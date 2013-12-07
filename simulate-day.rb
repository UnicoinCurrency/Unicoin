#!/usr/bin/env ruby

results = {}
results[:coins] = []
results[:w1] = 0
results[:w2] = 0
results[:w3] = 0
results[:w4] = 0

((365/2)*4).times do |i|
	
	allcoins = 0
	day = 1440
	while day > 0
		coins = 100
		r = rand(200000)
		(coins = 200;   results[:w1] += 1 ) if r > 30000 && r < 36001
		(coins = 300;   results[:w2] += 1 ) if r > 50000 && r < 52001
		(coins = 1000;  results[:w3] += 1 ) if r > 70000 && r < 70201
		(coins = 10000; results[:w4] += 1 ) if r > 80000 && r < 80021

		(i-1).times do |i|
			coins = coins / 2
		end

		day -= 2
		allcoins += coins
	end

	results[:coins] << allcoins
	print "\r#{i}:\t#{allcoins}"

end

puts "\rAverage coins per day: #{results[:coins].inject{ |sum, el| sum + el }.to_f / results[:coins].size}"
puts "Win 1: #{results[:w1]} \tper day: #{(results[:w1].to_f/results[:coins].size).to_f}\t"
puts "Win 2: #{results[:w2]} \tper day: #{(results[:w2].to_f/results[:coins].size).to_f}\t"
puts "Win 3: #{results[:w3]} \tper day: #{(results[:w3].to_f/results[:coins].size).to_f}\t"
puts "Win 4: #{results[:w4]} \tper day: #{(results[:w4].to_f/results[:coins].size).to_f}\t"
puts "All coins: #{results[:coins].inject{ |sum, el| sum + el }.to_f}"