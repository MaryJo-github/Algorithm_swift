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

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]-1].append((input[1]-1, input[2]))
}
let uv = readLine()!.split(separator: " ").compactMap { Int($0) }
let u = uv[0], v = uv[1]

var d = Array(repeating: Int.max, count: n)
var minHeap = Heap<Branch> { $0.w < $1.w }

d[u-1] = 0
minHeap.insert((u-1, d[u-1]))
while minHeap.size != 0 {
    let node = minHeap.removeFirst()!
    if node.w != d[node.v] { continue }
    for branch in graph[node.v] {
        if d[branch.v] <= d[node.v] + branch.w { continue }
        d[branch.v] = d[node.v] + branch.w
        minHeap.insert((branch.v, d[branch.v]))
    }
}

print(d[v-1])