/*
 *  Approach:
 *      Divide: Partition (rearrange) the array A[p..r] into two (possibly empty) subarrays A[p..q-1] and A[q+1..r] such that each 
 *              element of A[p..q-1] is less than or equal to A[q], which is, in turn, less than or equal to each element of A[q+1..r].
 *              Compute the index q as part of this partitioning procedure.
 *      Conquer: Sort the two subarrays A[p..q-1] and A[q+1..r] by recursive calls to quicksort.
 *      Combine: Because the subarrays are already sorted, no work is needed to combine them: the entire array A[p..r] is now sorted.
 *
 *  Stats:
 *                     Worst case running time: 𝜽(𝑛²)
 *      Average-case(or expected) running time: 𝜽(𝑛 ℓ𝑔 𝑛) i.e 𝜽(𝑛 ㏒₂ 𝑛)
 *
 *  Algorithm: (A is an array)
 *      Algorithm quicksort(A) returns array {
 *        if A.count == 1 {
 *          return A
 *        }
 *        pivot = A[randomIndex]
 *        smaller = [a | a < pivot] (a ϵ A)
 *        greater = [a | a > pivot] (a ϵ A)
 *        return quicksort(smaller) + ArrayOf(pivot) + quicksort(greater)
 *      }
 */

func quicksort<T: Comparable>(_ a: [T]) -> [T] {
  guard a.count > 1 else { return a }         // size 1 is always sorted

  let pivot = a[Int.random(in: 0..<a.count)]  // choosing a random element as pivot
  let smaller = a.filter { $0 < pivot }       // array with all the elements less than pivot
  let equal = [pivot]                         // array of the pivot element (size is one)
  let greater = a.filter { $0 > pivot }       // array with all the elements less than pivot

  return quicksort(smaller) + equal + quicksort(greater)
}

print(quicksort([1,6,4,3,5]))
