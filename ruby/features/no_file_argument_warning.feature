Feature: An error message should be shown if ran without the file argument.
  The script should warn the user.

Scenario: Running the script without a file argument.
  When I successfully run `unique_sequence_finder.rb`
  Then the stdout should contain "Must include file name parameter."
