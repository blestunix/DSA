func linearSearch<T: Equatable>(_ array: [T], _ target: T) -> Int? {
  for (i, item) in array.enumerated() where item == target {
    return i
  }
  return nil
}

let target = "Saud"
if let index = linearSearch(["Apple", "Saud", "Google", "Microsoft", "Amazon"], target) {
    print("Found at: \(index)")
} else {
    print("Target- \"\(target)\" not found!")
}
