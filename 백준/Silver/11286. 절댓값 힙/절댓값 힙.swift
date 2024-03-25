struct Heap<T> {
    private var box = [T]()
    private let condition: (T, T) -> Bool
    var top: T? { return box.first }
    var isEmpty: Bool { return box.isEmpty }
    var count: Int { return box.count }

    init(_ condition: @escaping (T, T) -> Bool) {
        self.condition = condition
    }

    private func getParentIndex(of index: Int) -> Int {
        return (index - 1) / 2
    }

    private func getLeftChildIndex(of index: Int) -> Int {
        return index * 2 + 1
    }

    private func getRightChildIndex(of index: Int) -> Int {
        return index * 2 + 2
    }

    mutating func insert(_ element: T) {
        box.append(element)
        var index = count - 1
        while index > 0 {
            let parent = getParentIndex(of: index)
            guard condition(box[index], box[parent]) else { break }
            box.swapAt(index, parent)
            index = parent
        }
    }

    mutating func removeFirst() -> T? {
        guard isEmpty == false else { return nil }
        box.swapAt(0, count - 1)
        let element = box.removeLast()
        var index = 0
        while index < count - 1 {
            var child = getLeftChildIndex(of: index)
            let right = getRightChildIndex(of: index)
            guard child <= count - 1 else { break }
            if right <= count - 1, condition(box[right], box[child]) {
                child = right
            }
            if condition(box[index], box[child]) { break }
            box.swapAt(index, child)
            index = child
        }
        return element
    }
}

let n = Int(readLine()!)!
var heap = Heap<Int>() { abs($0) == abs($1) ? $0 < $1 : abs($0) < abs($1) }
var result = ""

for _ in 0..<n {
    let input = Int(readLine()!)!

    if input == 0 {
        result += "\(heap.removeFirst() ?? 0)\n"
    } else {
        heap.insert(input)
    }
}

print(result)