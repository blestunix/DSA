/*
 * Author: Saud Kadiri
 *
 * Theory:
 *      A queue is a linear list in which data can be inserted at one ened, called the rear
 *  and deleted from the other end called the front. These restrictrions ensure thar the
 *  data are processed through the queue in the order in which they are received. A queue is
 *  a FIFO structure.
 *
 * Operations:
 *  1. Push(a.k.a Enqueue): This function inserts the passed item in the rear end of the queue
 *    ---------------
 *    |   "Google"  | -----
 *    ---------------     |
 *                        V
 *    ---------------------------------------------------
 *    ||    "IBM"    | "Microsoft" |   "Apple"   |
 *    ---------------------------------------------------
 *                        | push
 *                        V
 *    -----------------------------------------------------------
 *    ||    "IBM"    | "Microsoft" |   "Apple"   |   "Google"  |
 *    -----------------------------------------------------------
 *
 * 2. Pop(a.k.a Dequeue): This function deletes the item at the front end of the queue.
 *    -----------------------------------------------------------
 *    ||    "IBM"    | "Microsoft" |   "Apple"   |   "Google"  |
 *    -----------------------------------------------------------
 *                         | pop
 *                         V
 *    ---------------------------------------------------
 *    || "Microsoft" |   "Apple"   |   "Google"  |
 *    ---------------------------------------------------
 *
 * 3. Front: This function retrieves the item at the front end of the queue.
 *    ---------------------------------------------------
 *    || "Microsoft" |   "Apple"   |   "Google"  |
 *    ---------------------------------------------------
 *                          | front
 *                          V
 *                    ---------------
 *                    | "Microsoft" |
 *                    ---------------
 * 4. Rear: This function retrieves the item at the back end of the queue.
 *    ---------------------------------------------------
 *    || "Microsoft" |   "Apple"   |   "Google"  |
 *    ---------------------------------------------------
 *                          | rear
 *                          V
 *                    ---------------
 *                    |   "Google"  |
 *                    ---------------
 */

struct Queue<T> {
  private var items: [T] = []
  var isEmpty: Bool { items.isEmpty }
  
  init(_ start: [T] = []) {
    items = start
  }

  mutating func push(_ item: T) {
    items.append(item)
  }
  
  mutating func pop() {
    guard !isEmpty else { fatalError("\u{001B}[1;31mFailed to pop empty Queue.\u{001B}[0;0m") }
    items.removeFirst()
  }
  
  func front() -> T {
    guard !isEmpty else { fatalError("\u{001B}[1;31mQueue has no items; so failed to retrieve front.\u{001B}[0;0m") }
    return items.first!
  }

  func rear() -> T {
    guard !isEmpty else { fatalError("\u{001B}[1;31mQueue has no items; so failed to retrive rear.\u{001B}[0;0m") }
    return items.last!
  }
}

var queue = Queue<String>(["IBM", "Microsoft", "Apple"])
print(queue.isEmpty)
queue.push("Google")
queue.pop()
print(queue.front())
print(queue.rear())
