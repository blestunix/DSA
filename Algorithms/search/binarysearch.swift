func binarySearch<T: Comparable>(_ arr: [T], target: T) -> Int {
  let arr = arr.sorted()  // assure that the sorted condition is met
  var l = 0
  var r = arr.count - 1 // not necessary to subtract the '1'; since during integer division it gets rounded off
  while l <= r {
    let mid = l + (r - l) / 2 // mid = (l + r) / 2 has known issues
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
