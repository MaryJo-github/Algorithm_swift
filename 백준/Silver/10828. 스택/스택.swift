let n = Int(readLine()!)!
var stack = [Int]()
var result = [Int]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ")

    switch line[0] {
        case "push":
            stack.append(Int(line[1])!)
        case "pop":
            result.append(stack.popLast() ?? -1)
        case "size":
            result.append(stack.count)
        case "empty":
            result.append(stack.isEmpty ? 1 : 0)
        case "top":
            result.append(stack.last ?? -1)
        default:
            break
    }
}

result.forEach { print($0) }