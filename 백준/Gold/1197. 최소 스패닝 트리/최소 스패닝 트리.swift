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

let ve = readLine()!.split(separator: " ").compactMap { Int($0) }
let v = ve[0], e = ve[1]
var graph = Array(repeating: [(u: Int, v: Int, weight: Int)](), count: v)

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0] - 1].append((input[0] - 1, input[1] - 1, input[2]))
    graph[input[1] - 1].append((input[1] - 1, input[0] - 1, input[2]))
}

var minSpanning = Set<Int>()
var minHeap = Heap<(u: Int, v: Int, weight: Int)> { $0.2 < $1.2 }
var totalWeight = 0

minSpanning.insert(0)
for branch in graph[0] {
    minHeap.insert(branch)
}

while minSpanning.count < v {
    let minLine = minHeap.removeFirst()!
    if !minSpanning.contains(minLine.v) {
        minSpanning.insert(minLine.v)
        totalWeight += minLine.weight
        for branch in graph[minLine.v] {
            minHeap.insert(branch)
        }
    }
}

print(totalWeight)