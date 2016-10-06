#!/usr/bin/env ruby

# Finds unique 4 character sequences in all words, given a word per line in a dictionary file passed
# in. Outputs sequences and words to separate files 'sequences' and 'words' on corresponding lines.

# Finds 4 character unique sequences from lines in the file passed in, with corresponding words they
# were taken from.
# Returns Hash with unique sequences as key, corresponding word as value.
def unique_sequences_from_words(file_name)
  unique_sequences = {}
  begin
    IO.foreach(file_name).with_index do |line|
      line.strip!
      # Only look for sequences of 4 characters or more.
      if line.length >= 4
        max_start = line.length - 4

        (0..max_start).each do |start|
          sequence = line[start...start + 4]
          # If sequence key already exists, set value to false since not unique.
          if unique_sequences.has_key? sequence
            unique_sequences[sequence] = false unless unique_sequences[sequence] == false
          else
            unique_sequences[sequence] = line
          end
        end
      end
    end
  rescue Errno::ENOENT
    puts 'Input file not found.'
  end
  # Remove non unique sequences.
  unique_sequences.delete_if { |k, v| !v }
end

# Save an array of strings to file, one line per element.
def lines_to_file(lines, file_name)
  File.open(file_name, 'w') do |file|
    lines.each{ |line| file.puts line }
  end
end

file_name = ARGV.shift
if file_name.nil?
  puts 'Must include file name parameter.'
  puts 'Usage: unique_sequence_finder.rb dictionary_file_name.txt'
else
  unique_sequences = unique_sequences_from_words(file_name)
  # Sort alphabetically on key.
  # unique_sequences = Hash[ unique_sequences.sort_by{ |k, v| k } ] 

  lines_to_file(unique_sequences.keys, 'sequences')
  lines_to_file(unique_sequences.values, 'words')
end
