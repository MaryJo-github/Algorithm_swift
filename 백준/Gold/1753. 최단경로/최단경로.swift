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

typealias Branch = (dist: Int, index: Int)
let ve = readLine()!.split(separator: " ").compactMap { Int($0) }
let v = ve[0], e = ve[1]
let k = Int(readLine()!)!
let maxValue = Int.max
var d = Array(repeating: maxValue, count: v)
var graph = Array(repeating: [(v: Int, w: Int)](), count: v)
var minHeap = Heap<Branch> { $0.dist < $1.dist }

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]-1].append((input[1]-1, input[2]))
}

d[k-1] = 0
minHeap.insert((d[k-1], k-1))

while minHeap.size != 0 {
    let cur = minHeap.removeFirst()!
    if d[cur.index] != cur.dist { continue }
    for next in graph[cur.index] {
        if d[next.v] <= d[cur.index] + next.w {
            continue
        }
        d[next.v] = d[cur.index] + next.w
        minHeap.insert((d[next.v], next.v))
    }
}

for i in 0..<v {
    if d[i] == maxValue { print("INF") }
    else { print(d[i]) }
}