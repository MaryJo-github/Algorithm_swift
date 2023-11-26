var result = [String]()

while true {
    let line = readLine()!
    var stack = [Character]()

    guard line != "." else { break }

    for ch in line {
        switch ch {
            case "(", "[":
            stack.append(ch)
            case ")", "]":
            if (ch == ")" && stack.last == "(") || (ch == "]" && stack.last == "[") {
                stack.removeLast()
            } else {
                stack.append(ch)
            }
            default:
            continue
        }
    }

    if stack.isEmpty {
        result.append("yes")
    } else {
        result.append("no")
    }
}

result.forEach { print($0) }
