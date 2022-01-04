class Node<T> {
    var data: T
    var next: Node<T>?

    init(data: T, next: Node? = nil) {
        self.data = data
        self.next = next
    } 
}

class SinglyLinkedList<T: Equatable> {
    var head: Node<T>?
    
    var isEmpty: Bool {
        head == nil
    }
    
    var tail: Node<T>? {
        var node = head
        while node?.next != nil {
            node = node!.next
        }
        return node
    }
    
    var count: Int {
        var count = 0
        var node = head
        while node != nil {
            count += 1
            node = node!.next
        }
        return count
    }
    
    init(head: Node<T>? = nil) {
        self.head = head
    }
    
    func insert(node: Node<T>) {    // insert at tail (rear end)
        if self.head == nil {
            self.head = node
        } else {
            var traverser = head
            while traverser?.next != nil {
                traverser = traverser?.next
            }
            traverser?.next = node
        }
    }

    func insertHead(newHead: Node<T>) { // insert at the head end(front end)
        newHead.next = self.head
        self.head = newHead
    }
    
    func insert(at index: Int, newNode: Node<T>) { // zero-indexed
        guard 0 ... count ~= index else { fatalError("IndexOutOfRange: Position:\(index) not in \(1) ... \(count)") } 
        if index == 0 {
            insertHead(newHead: newNode)
        } else {
            var i = 1
            var node = head
            while node != nil && i < index {
                i += 1
                node = node!.next
            }
            newNode.next = node!.next 
            node!.next = newNode
        }
    }

    func removeHead() {
        self.head = self.head?.next // remove the head node (node at the front end)
    }
    
    func remove() {
        if self.head?.next == nil {
            self.removeHead()
        } else {
            var traverser = self.head
            while traverser?.next?.next != nil {
                traverser = traverser!.next
            }
            traverser?.next = nil
        }
    }

    func remove(n: Int) {   // Ordinal
        guard n >= 1 else { return }
        var node = head
        if n == 1 {
            self.removeHead()
        } else {
            for i in 1..<n {
                if i == n - 1 || node == nil {
                    break
                }
                print(node!.data)
                node = node?.next
            }
            node?.next = node?.next?.next
        }
    }
    
    func reverse() {
        var prev: Node<T>?
        var curr = head
        while curr != nil {
            let tempNext = curr!.next
            curr!.next = prev
            prev = curr
            curr = tempNext
        }
        head = prev
    }
    
    func search(target: T) -> Bool { // Search for an element in a the ll
        var traverser = head
        while traverser != nil {
            if traverser!.data == target {
                return true
            }
            traverser = traverser!.next
        }
        return false
    }

    func get_mid() -> Node<T>?{
        var fast = head
        var slow = head
        while fast?.next != nil {
            fast = fast!.next?.next
            slow = slow!.next
        }
        return slow
    }

    func display() {
        print("Current SLL:")
        var node = head
        while node != nil {
            print(node!.data)
            node = node!.next
        }
    }
}

var ll = SinglyLinkedList<Int>()
ll.insert(node: Node(data: 10))
ll.insert(node: Node(data: 20))
ll.insert(node: Node(data: 30))
print("Mid:", ll.get_mid()!.data)
ll.display()

ll.removeHead()
ll.remove()
ll.display()

ll.insertHead(newHead: Node(data: 0))
ll.display()

ll.reverse()
ll.display()
print(ll.search(target: 0))
print(ll.isEmpty)
