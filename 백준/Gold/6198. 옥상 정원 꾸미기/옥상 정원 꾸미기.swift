let n = Int(readLine()!)!
var stack = [(Int, Int)]()
var result = 0

for i in 0..<n {
    let h = Int(readLine()!)!
    while !stack.isEmpty && stack.last!.1 <= h {
        stack.removeLast()
    }
    result += stack.count
    stack.append((i, h))
}

print(result)