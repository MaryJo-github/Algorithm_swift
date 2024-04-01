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

let nk = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nk[0]
let k = nk[1]
var jewels = [(weight: Int, price: Int)]()
var bags = [Int]()
var heap = Heap<(weight: Int, price: Int)> { $0.price > $1.price }
var result = 0

for _ in 0..<n {
    let mv = readLine()!.split(separator: " ").compactMap { Int($0) }
    jewels.append((mv[0], mv[1]))
}

for _ in 0..<k {
    bags.append(Int(readLine()!)!)
}

jewels.sort { $0.weight < $1.weight }
bags.sort()

var jewelIndex = 0
for bag in bags {
    while jewelIndex < jewels.count,
    jewels[jewelIndex].weight <= bag {
        heap.insert(jewels[jewelIndex])
        jewelIndex += 1
    }

    if let jewel = heap.removeFirst() {
        result += jewel.price
    }
}

print(result)