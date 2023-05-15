if !ARGV[0]
	file_name = "results_rabbit.csv"
else
	file_name = ARGV[0]
end

total_successes = 0
total_trials = 0
text = File.readlines(file_name)
for line in text
	num_trials, *_, success_rate = line.split(",").map {|x| x.strip}
	total_successes += num_trials.to_f * success_rate.to_f
	total_trials += num_trials.to_i
end

puts "Total successes: #{total_successes}"
puts "Total trials: #{total_trials}"
puts "Success rate: #{total_successes / total_trials}"
