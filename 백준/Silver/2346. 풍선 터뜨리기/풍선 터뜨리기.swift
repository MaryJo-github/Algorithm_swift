let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
let linkedList = LinkedList()
var removeElement: Int = 1
var result = [Int]()

for i in 1...n {
    linkedList.append(element: i)
}

for _ in 0..<n {
    result.append(removeElement)
    removeElement = linkedList.remove(next: input[removeElement-1])
}

print(result.map { String($0) }.joined(separator: " "))

final class Node<Int> {
    let element: Int
    var left: Node?
    var right: Node?

    init(element: Int, left: Node? = nil, right: Node? = nil) {
        self.element = element
        self.left = left
        self.right = right
    }
}

final class LinkedList {
    var start: Node<Int>?
    var end: Node<Int>?
    var cnt = 0

    func append(element: Int) {
        let node = Node(element: element)

        if start == nil {
            start = node
            end = start
            end?.left = start
            end?.right = start
            start?.left = end
            start?.right = end
        } else {
            end?.right = node
            node.left = end
            node.right = start
            end = node
            start?.left = end
        }
        cnt += 1
    }

    func remove(next: Int) -> Int {
        start?.left?.right = start?.right
        start?.right?.left = start?.left

        var nextNode = start!
        for _ in 0..<abs(next) {
            if next < 0 {
                nextNode = nextNode.left!
            } else {
                nextNode = nextNode.right!
            }
        }

        cnt -= 1
        start = nextNode
        return start!.element
    }
}