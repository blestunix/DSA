func binarySearch<T: Comparable>(_ arr: [T], target: T) -> Int {
  var lo = 0
  var hi = arr.count
  while hi > lo {
    let mid = lo + (hi - lo) / 2 // mid = (lo + hi) / 2 has known issues
    if arr[mid] < target {
      lo = mid + 1
    } else {
      hi = mid
    }
  }
  return lo < arr.count ? lo : -1
}

var arr = [1, 2, 4, 6, 10, 19, 99]  // strictly a sorted arrray only; in case of letter alphabetically!

print(binarySearch(arr, target: 99))
// 6
