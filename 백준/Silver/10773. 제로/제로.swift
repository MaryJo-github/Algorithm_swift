let k = Int(readLine()!)!
var stack = [Int]()

for _ in 0..<k {
    let input = Int(readLine()!)!

    guard input != 0 else {
        stack.removeLast()
        continue
    }

    stack.append(input)
}

print(stack.reduce(0, +))