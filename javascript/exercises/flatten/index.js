module.exports = flatten;

/*
 * Flattens an array of arbitrary depth.
 */
function flatten(array) {
  var newArray = [];

  // If flattened element add, else if is Array recursively call flatten and concat.
  for (var i = 0; i < array.length; i++) {  
    if (Array === array[i].constructor)  {
      newArray = newArray.concat(flatten(array[i]));  
    } else {
      newArray.push(array[i]);  
    }  
  }  
  return newArray;
}
