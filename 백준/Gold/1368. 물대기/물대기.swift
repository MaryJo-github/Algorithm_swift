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

let n = Int(readLine()!)!
var graph = Array(repeating: [(u: Int, v: Int, w: Int)](), count: n+1)

for i in 0..<n {
    let weight = Int(readLine()!)!
    graph[i].append((i, n, weight))
    graph[n].append((n, i, weight))
}

for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for (index, value) in input.enumerated() {
        guard i != index else { continue }
        graph[i].append((i, index, value))
    }
}

var minSpanning = Set<Int>()
var minHeap = Heap<(u: Int, v: Int, w: Int)> { $0.w < $1.w }
var totalCost = 0

minSpanning.insert(0)
for branch in graph[0] {
    minHeap.insert(branch)
}

while minSpanning.count < n + 1 {
    let minLine = minHeap.removeFirst()!

    if !minSpanning.contains(minLine.v) {
        minSpanning.insert(minLine.v)
        totalCost += minLine.w
        for branch in graph[minLine.v] {
            minHeap.insert(branch)
        }
    }
}

print(totalCost)