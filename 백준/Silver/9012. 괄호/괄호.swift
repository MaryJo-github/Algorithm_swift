let t = Int(readLine()!)!
var result = [String]()

for _ in 0..<t {
    let line = readLine()!
    var stack = [Character]()

    for ch in line {
        switch ch {
            case "(":
            stack.append(ch)
            case ")":
            if stack.last == "(" {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
            default:
            continue
        }
    }

    if stack.isEmpty {
        result.append("YES")
    } else {
        result.append("NO")
    }
}

result.forEach { print($0) }