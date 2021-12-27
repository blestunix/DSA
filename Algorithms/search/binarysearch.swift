func binarySearch<T: Comparable>(_ arr: [T], target: T) -> Int {
  let arr = arr.sorted()
  var l = 0
  var r = arr.count - 1
  while l <= r {
    let mid = l + (r - l) / 2
    if arr[mid] == target {
        return mid
    } 
    if arr[mid] < target {
      l = mid + 1
    } else {
      r = mid - 1
    }
  }
  return -1
}

var arr = [1, 2, 4, 6, 10, 19, 99]  // strictly a sorted arrray only; in case of letter alphabetically!

print(binarySearch(arr, target: 99))
// 6
