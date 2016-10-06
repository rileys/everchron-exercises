module.exports = memoize;

/*
 * Given a particular function with arguments, caches the results based on arguments, and returns
 * those results in the future instead of re-running the function.
 */
function memoize(functionToMemoize) {
  var memoizedCache = {};

  return function() {
    var args = Array.prototype.slice.call(arguments);

    // If args key exists for current args, return value from cache; else assign function results to
    // cache and return.
    if (args in memoizedCache) {
      return memoizedCache[args];
    } else {
      return memoizedCache[args] = functionToMemoize.apply(this, args);
    }
  }
}
