#!/usr/bin/env ruby

# Iterate through each line of the log file provided as an argument
ARGF.each do |line|
    # Extract sender, receiver, and flags using regex
    match_data = line.match(/\[from:(?<sender>[^\]]+)\]
    \[to:(?<receiver>[^\]]+)\] \[flags:(?<flags>[^\]]+)\]/)

    # Output sender, receiver, and flags if a match is found
    puts "#{match_data[:sender]},#{match_data[:receiver]},
    #{match_data[:flags]}" if match_data
end
