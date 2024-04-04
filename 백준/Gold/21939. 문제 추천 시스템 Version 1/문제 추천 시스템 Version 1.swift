struct Heap<T> {
    var box = [T]()
    private let condition: (T, T) -> Bool
    var size: Int { return box.count }
    var first: T? { return box.first }

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
var minHeap = Heap<(Int, Int, Int)> { $0.0 == $1.0 ? $0.1 < $1.1 : $0.0 < $1.0 } // (난이도, 문제번호, 인덱스)
var maxHeap = Heap<(Int, Int, Int)> { $0.0 == $1.0 ? $0.1 > $1.1 : $0.0 > $1.0 } // (난이도, 문제번호, 인덱스)
var indexMatching = Array(repeating: -1, count: 100001)
var isSolved = [Bool]()
var count = 0

for _ in 0..<n {
    let pl = readLine()!.split(separator: " ").compactMap { Int($0) }
    minHeap.insert((pl[1], pl[0], count))
    maxHeap.insert((pl[1], pl[0], count))
    indexMatching[pl[0]] = count
    isSolved.append(false)
    count += 1
}

let m = Int(readLine()!)!
var result = ""

for _ in 0..<m {
    let input = readLine()!.split(separator: " ")

    switch input[0] {
        case "add":
        minHeap.insert((Int(input[2])!, Int(input[1])!, count))
        maxHeap.insert((Int(input[2])!, Int(input[1])!, count))
        indexMatching[Int(input[1])!] = count
        isSolved.append(false)
        count += 1
        case "solved":
        let index = indexMatching[Int(input[1])!]
        isSolved[index] = true
        default:
        switch input[1] {
            case "1":
            while isSolved[maxHeap.first!.2] {
                _ = maxHeap.removeFirst()
            }
            result += "\(maxHeap.first!.1)\n"
            default:
            while isSolved[minHeap.first!.2] {
                _ = minHeap.removeFirst()
            }
            result += "\(minHeap.first!.1)\n"
        }
    }
}

print(result)