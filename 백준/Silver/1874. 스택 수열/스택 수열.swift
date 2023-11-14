let n = Int(readLine()!)!
var stack = [Int]()
var target = [Int]()
var source = Array(repeating: 0, count: n)
(0..<n).forEach { source[$0] = n - $0 }
var result = [Character]()

for _ in 0..<n {
    target.append(Int(readLine()!)!)
}
target.reverse()

while target.isEmpty == false {
    if stack.last != target.last {
        if let number = source.popLast() {
            stack.append(number)
            result.append("+")
        } else {
            break
        }
    } else {
        target.removeLast()
        stack.removeLast()
        result.append("-")
    }
}

if target.isEmpty {
    result.forEach { print($0) }
} else {
    print("NO")
}