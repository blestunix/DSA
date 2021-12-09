// A generic Merge sort!

struct MergeSort {
    func mergesort<T: Comparable>(_ array: [T], descending: Bool = false) -> [T] {
        let mid = array.count / 2
        guard mid != 0 else { return array } // exhausted array

        let lArray = mergesort(Array(array[0..<mid]))
        let rArray = mergesort(Array(array[mid..<array.count]))
        
        let result = merge(leftArray: lArray, rightArray: rArray)
    
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
