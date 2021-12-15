// A generic Merge sort!
/*
 *  Approach:
 *      Divide: Divide the n-element sequence to be sorted into two subsequences of n = 2 elements each.
 *      Conquer: Sort the two subsequences recursively using merge sort.
 *      Combine: Merge the two sorted subsequences to produce the sorted answer.
 *
 *  Stats:
 *                     Worst case running time: 𝜽(𝑛 ℓ𝑔 𝑛) i.e. 𝜽(𝑛 ㏒₂ 𝑛)
 *      Average-case(or expected) running time: 𝜽(𝑛 ℓ𝑔 𝑛) i.e 𝜽(𝑛 ㏒₂ 𝑛)
 *  Algorithms:
 *      Algorithm merge-sort(A) returns Array {
 *          mid = size(A) / 2
 *          if (mid == 0) { 
 *              return A
 *          }
 *          left_A = A[0..<mid]
 *          right_A = A[mid..<size(A)]
 *          return merge(left_A, right_A)
 *      }
 *
 *      Algorithm merge(left_A, right_A) returns Array {
 *          l = 0
 *          r = 0
 *          sorted_A = emptyArray()
 *          while l < size(left_A) and r < size(right_A) {
 *              if (left_A[l] < right_A[r]) {
 *                  sorted_A.append(left_A[l])
 *                  l++
 *              } else if (right_A[r] < left_A[r]) {
 *                  sorted_A.append(right_A[r])
 *                  r++
 *              } else {
 *                  sorted_A.append(left_A[l])
 *                  sorted_A.append(right_A[r])
 *                  l++
 *                  r++
 *              }
 *          }
 *          while l < size(left_A) {
 *              sorted_A.append(left_A[l])
 *              l++
 *          }
 *          while r < size(right_A) {
 *              sorted_A.append(right_A[r])
 *              r++
 *          }
 *          return sorted_A
 *      }
 */

struct MergeSort {
    func mergesort<T: Comparable>(_ array: [T], descending: Bool = false) -> [T] {
        let mid = array.count / 2
        guard mid != 0 else { return array } // exhausted array
        
        let result = merge(leftArray: mergesort(Array(array[0..<mid])), rightArray: mergesort(Array(array[mid..<array.count])))
    
        return descending ? result.reversed() : result
    }
    private func merge<T: Comparable>(leftArray: [T], rightArray: [T]) -> [T] {
        var sortedArray: [T] = []
        var l = 0
        var r = 0

        while l < leftArray.count && r < rightArray.count {
            if leftArray[l] < rightArray[l] {
                sortedArray.append(leftArray[l])
                l += 1
            } else if leftArray[l] > rightArray[r]{
                sortedArray.append(rightArray[r])
                r += 1
            } else {
                sortedArray.append(leftArray[l])
                sortedArray.append(rightArray[r])
                r += 1
                l += 1
            }
        }
        // Look for the remaining elements in the left array
        while l < leftArray.count {
            sortedArray.append(leftArray[l])
            l += 1
        }
        // Look for the remaining elements in the right array
        while r < rightArray.count {
            sortedArray.append(rightArray[r])
            r += 1
        }
        return sortedArray
    }
}

let sort = MergeSort()
print(sort.mergesort(["da","e", "a", "c", "b"]))
