let n = Int(readLine()!)!
var heap = [0]
var result = ""

for _ in 0..<n {
    let input = Int(readLine()!)!

    if input == 0 {
        result += "\(top())\n"
        pop()
    } else {
        push(x: input)
    }
}

print(result)

func push(x: Int) {
    heap.append(x)
    var index = heap.count-1
    while index != 1 {
        let par = index / 2
        if isSmaller(x: heap[par], then: heap[index]) { break }
        heap.swapAt(par, index)
        index = par
    }
}

func top() -> Int {
    guard heap.count > 1 else { return 0 }

    return heap[1]
}

func pop() {
    guard heap.count > 1 else { return }

    heap.swapAt(1, heap.count - 1)
    heap.removeLast()
    var index = 1
    while 2 * index <= heap.count - 1 {
        let lc = 2 * index
        let rc = 2 * index + 1
        var minChild = lc
        if rc <= heap.count - 1, isSmaller(x: heap[rc], then: heap[lc])  {
            minChild = rc
        }
        if isSmaller(x: heap[index], then: heap[minChild]) { break }
        heap.swapAt(index, minChild)
        index = minChild
    }
}

func isSmaller(x: Int, then y: Int) -> Bool {
    if abs(x) < abs(y) {
        return true
    } else if abs(x) == abs(y), x <= y {
        return true
    }

    return false
}