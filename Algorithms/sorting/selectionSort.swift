// Name: It is so called because it selects the smallest/largest element in the list and swaps it with the element at the first position, 
// then selects the next smallest/largest element in the list and swaps it with the element at the second position and so on until it is 
// done with the number at last position in the list.
func selectionSort<T: Comparable>(_ arr: inout [T]) {
  for i in 0 ..< arr.count {
    let min_i = arr.firstIndex(of: arr[i...].min()!)! // find the index of the smallest element from the remaining list
    (arr[i], arr[min_i]) = (arr[min_i], arr[i])       // swap
  }
}

var lst = [45, 20, 34, 21, 81, 42]
selectionSort(&lst)
print(lst)
