let input = readLine()!.split(separator: " ").map { Int($0)! }
var result = [Int]()
let linkedList = LinkedList()
(0..<input[0]).forEach { linkedList.append($0) }

while linkedList.cnt != 0 {
    result.append(linkedList.remove(input[1]))
}

print("<\(result.map { String($0+1) }.joined(separator: ", "))>")

final class Node: Equatable {
    static func == (lhs: Node, rhs: Node) -> Bool {
        return lhs.element == rhs.element
    }

    let element: Int
    var left: Node?
    var right: Node?

    init(element: Int) {
        self.element = element
    }
}

final class LinkedList {
    var start: Node?
    var end: Node?
    var cnt: Int = 0

    func append(_ element: Int) {
        let node = Node(element: element)

        if start == nil {
            start = node
            end = start
            end?.right = start
            end?.left = start
            start?.right = end
            start?.left = end
        } else {
            node.left = end
            end?.right = node
            end = node
            end?.right = start
            start?.left = end
        }
        cnt += 1
    }

    func remove(_ order: Int) -> Int {
        var node = start

        for _ in 1..<order {
            node = node?.right
        }

        node?.left?.right = node?.right
        node?.right?.left = node?.left
        start =  node?.right
        node?.left = nil
        node?.right = nil

        cnt -= 1

        return node?.element ?? -1
    }
}