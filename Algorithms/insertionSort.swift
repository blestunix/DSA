/*
 *  Approach:
 *      Insertion sort works the way many people sort a hand of playing cards. We start with an empty left hand and the
 *      cards face down on the table. We then remove one card at a time from the table and insert it into the correct
 *      position in the left hand. To find the correct position for a card, we compare it with each of the cards already
 *      in the hand, from right to left.
 *
 *  Stats:
 *                     Worst case running time: 𝜽(𝑛²)
 *      Average-case(or expected) running time: 𝜽(𝑛²)
 *
 *  Algorithms:
 *  Insertion sort algorithim for 1-based array indexing (based on Introduction to Algorithms, Third Edition, MIT, Page: 18)
 *  Algorithm insertionSort:
 *    1 for j = 2 to A.length
 *    2   key = A[j]
 *    3   // Insert A[j]  into the sorted sequence A[1..j - 1].
 *    4   i = j - 1
 *    5   while i > 0 and A[i] > key
 *    6     A[i + 1] = A[i]
 *    7     i--
 *    8   A[i + 1] = key
 */

func insertionSort<T: Comparable>(_ arr: inout [T], descending: Bool = false) {
    for i in 1..<arr.count {
        let key = arr[i]
        var j = i - 1
        while j >= 0 && arr[j] > key {
            arr[j + 1] = arr[j]  
            j -= 1
        }
        arr[j + 1] = key
    }
    // If descending then run this!!
    if descending == true {
        arr.reverse()
    }
}

var array = [1, 3, 2, 6, 5, 4]
insertionSort(&array)
print(array) // [1, 2, 3, 4, 5, 6]
