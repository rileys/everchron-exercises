Feature: An error message should be shown if ran with a file argument for a file that does not exist
  The script should warn the user

Scenario: Running the script with a file argument that exists, but the file does not.
  Given the file "tmp/aruba/no_file.txt" doesn't exist
  When I successfully run `unique_sequence_finder.rb no_file.txt`
  Then the stdout should contain "Input file not found."
