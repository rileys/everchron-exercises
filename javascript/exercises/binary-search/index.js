module.exports = search;

/*
 * Searches array passed in for index of word passed in.
 * If found returns index, else -1.
 */
function search(array, word) {
  var startIndex = 0,
    endIndex = array.length - 1,
    currentIndex,
    currentElement;

  // If word found in middle position, returns index.
  // Otherwise will keep recalculating start/end until invalid.
  while (startIndex <= endIndex) {
    currentIndex = Math.floor((startIndex + endIndex) / 2);
    currentElement = array[currentIndex];

    if (currentElement > word) {
      endIndex = currentIndex - 1;
    } else if (currentElement < word) {
      startIndex = currentIndex + 1;
    } else {
      return currentIndex;
    }
  }
  return -1; // Word not found.
}
