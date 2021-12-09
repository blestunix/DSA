/*
 * Author: Saud Kadiri
 *
 * Theory:
 *        A stack is a linear list in which all additions and deletions are
 *    restricted to one end, called the top. The stacks are known as the 
 *    last in– first out (LIFO) data structure.
 *
 * Operations:
 *  1. Push: This function inserts the passed item into the stack.
 *    ---------------
 *    |   "Google"  | -----
 *    ---------------     |                          |  "Google"   |
 *                        v                          ---------------
 *              |   "Apple"   |                      |   "Apple"   |        
 *              ---------------       ->push         ---------------
 *              | "Microsoft" |                      | "Microsoft" |
 *              ---------------                      ---------------
 *              |   "IBM"     |                      |   "IBM"     |
 *              ---------------                      ---------------
 *
 * 2. Pop: This function deletes the item at the top of the stack.
 *               |  "Google"   |
 *               ---------------
 *               |   "Apple"   |                     |   "Apple"   |
 *               ---------------        ->pop        ---------------
 *               | "Microsoft" |                     | "Microsoft" |
 *               ---------------                     ---------------
 *               |   "IBM"     |                     |   "IBM"     |
 *               ---------------                     ---------------
 *
 * 3. Peek: This function retrieves the item at the top of the stack.
 *               |   "Apple"   |                     ---------------
 *               ---------------             --->    |   "Apple"   |
 *               | "Microsoft" |             |       ---------------
 *               ---------------     ->peek---
 *               |   "IBM"     |
 *               ---------------
 */

struct Stack<T> {
  private var items: [T] = []
  var isEmpty: Bool { items.isEmpty }
  
  init(_ start: [T] = []) {
    items = start
  }

  mutating func push(_ item: T) {
    items.append(item)
  }
  
  mutating func pop() {
    guard !isEmpty else { fatalError("\u{001B}[1;31mFailed to pop empty stack.\u{001B}[0;0m") }
    items.removeLast()
  }
  
  func peek() -> T {
    guard !isEmpty else { fatalError("\u{001B}[1;31mStack has no items; so failed peek operation.\u{001B}[0;0m") }
    return items.last!
  }
}

var stack = Stack<String>(["IBM", "Microsoft", "Apple"])
print(stack.isEmpty)
stack.push("Google")
stack.pop()
print(stack.peek())
