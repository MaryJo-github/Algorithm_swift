let n = Int(readLine()!)!
var result = 0

for _ in 0..<n {
    let line = readLine()!
    var stack = [Character]()

    for ch in line {
        if stack.last == ch {
            stack.removeLast()
        } else {
            stack.append(ch)
        }
    }

    if stack.isEmpty {
        result += 1
    }
}

print(result)