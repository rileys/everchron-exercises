Feature: Only 4 character unique sequences from words should be saved.
  The 4 characters should be saved to a file named 'sequences' with 1 line per file.
  The word the character was extracted from should be saved to a file named 'words' on the line 
  corresponding to the sequence.

Scenario: Running the script with a dictionary containing 2 unique 4 character sequences, 1 non unique.
  Given a file named "sample_data.txt" with:
  """
  abcde
  bcdef
  """
  When I successfully run `unique_sequence_finder.rb sample_data.txt`
  Then the file named "sequences" should contain:
  """
  abcd
  cdef
  """
  And the file named "words" should contain:
  """
  abcde
  bcdef
  """
  And the file named "sequences" should not contain:
  """
  bcde
  """