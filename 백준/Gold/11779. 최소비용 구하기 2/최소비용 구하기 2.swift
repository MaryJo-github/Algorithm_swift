struct Heap<T> {
    private var box = [T]()
    private let condition: (T, T) -> Bool
    var size: Int { return box.count }

    init(condition: @escaping (T, T) -> Bool) {
        self.condition = condition
    }

    private func getParent(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func getLeftChild(of index: Int) -> Int {
        return index * 2 + 1
    }

    private func getRightChild(of index: Int) -> Int {
        return index * 2 + 2
    }

    mutating func insert(_ element: T) {
        box.append(element)
        var index = size - 1
        while index > 0 {
            let parent = getParent(of: index)
            guard condition(box[index], box[parent]) else { break }
            box.swapAt(index, parent)
            index = parent
        }
    }

    mutating func removeFirst() -> T? {
        guard size > 1 else { return box.popLast() }
        box.swapAt(0, size - 1)
        let element = box.removeLast()
        var index = 0
        while index * 2 + 1 < size {
            var child = getLeftChild(of: index)
            let right = getRightChild(of: index)
            if right < size, condition(box[right], box[child]) {
                child = right
            }
            guard condition(box[child], box[index]) else { break }
            box.swapAt(child, index)
            index = child
        }

        return element
    }
}

typealias Branch = (v: Int, w: Int)
let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: [Branch](), count: n)
var d = Array(repeating: Int.max, count: n)
var route = Array(repeating: 0, count: n)
var minHeap = Heap<Branch> { $0.w < $1.w }

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]-1].append((input[1]-1, input[2]))
}
let ab = readLine()!.split(separator: " ").compactMap { Int($0) }
let a = ab[0], b = ab[1]

d[a-1] = 0
minHeap.insert((a-1, d[a-1]))
while minHeap.size != 0 {
    let cur = minHeap.removeFirst()!
    if d[cur.v] != cur.w { continue }
    for next in graph[cur.v] {
        if d[next.v] <= d[cur.v] + next.w { continue }
        d[next.v] = d[cur.v] + next.w
        minHeap.insert((next.v, d[next.v]))
        route[next.v] = cur.v
    }
}

var routes = [b-1]
var cur = b-1
while cur != a-1 {
    routes.append(route[cur])
    cur = route[cur]
}
print(d[b-1])
print(routes.count)
print(routes.reversed().map { String($0+1) }.joined(separator: " "))