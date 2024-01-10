#!/usr/bin/env ruby

# Accept one argument from command line
input = ARGV[0]

# Use Oniguruma regex to match "School"
result = input.scan(/School/).join

# Print the result with a newline character at the end
puts result + "\n"
