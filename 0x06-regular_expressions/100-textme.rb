#!/usr/bin/env ruby

# Read input from command line argument
input = ARGV[0]

# Regular expression to extract sender, receiver, and flags
regex = /\[from:(?<sender>[^\]]+)\] \[to:(?<receiver>[^\]]+)\] \[flags:(?<flags>[^\]]+)\]/

# Match the regular expression against the input
matches = input.match(regex)

# Output sender, receiver, and flags if match is found
if matches
  sender = matches[:sender]
  receiver = matches[:receiver]
  flags = matches[:flags]
  puts "#{sender},#{receiver},#{flags}"
end

