struct Heap<T> {
    var box = [T]()
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

let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let k = Int(readLine()!)!
    var minHeap = Heap<(Int, Int)>() { $0.0 <= $1.0 }
    var maxHeap = Heap<(Int, Int)>() { $0.0 > $1.0 }
    var visited = [Bool]()
    var count = 0
    var maxValue: Int? = nil
    var minValue: Int? = nil

    for _ in 0..<k {
        let input = readLine()!.split(separator: " ")
        let n = Int(input[1])!

        switch input[0] {
            case "D":
            if n == 1 {
                while let r = maxHeap.removeFirst() {
                    if visited[r.1] == false {
                        visited[r.1] = true
                        break
                    }
                }
            } else {
                while let r = minHeap.removeFirst() {
                    if visited[r.1] == false {
                        visited[r.1] = true
                        break
                    }
                }
            }
            default:
            minHeap.insert((n, count))
            maxHeap.insert((n, count))
            visited.append(false)
            count += 1
        }
    }

    while let r = maxHeap.removeFirst() {
        if visited[r.1] == false {
            maxValue = r.0
            break
        }
    }

    while let r = minHeap.removeFirst() {
        if visited[r.1] == false {
            minValue = r.0
            break
        }
    }

    if let maxValue = maxValue, let minValue = minValue {
        result += "\(maxValue) \(minValue)\n"
    } else {
        result += "EMPTY\n"
    }
}
print(result)