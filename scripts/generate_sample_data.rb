require_relative '../spec/spec_helper'

File.open('pipe_delimited.txt', 'w') do |file|
  50.times do
    file.puts generate_row(' | ')
  end
end

File.open('comma_delimited.txt', 'w') do |file|
  50.times do
    file.puts generate_row(', ')
  end
end

File.open('space_delimited.txt', 'w') do |file|
  50.times do
    file.puts generate_row(' ')
  end
end
