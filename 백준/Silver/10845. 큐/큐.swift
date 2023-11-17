let n = Int(readLine()!)!
var queue = [Int]()
var result = [Int]()

for _ in 0..<n {
    let input = readLine()!.split(separator: " ")

    switch input.first {
        case "push":
        queue.append(Int(input.last!)!)
        case "pop":
        result.append(queue.isEmpty ? -1 : queue.removeFirst())
        case "size":
        result.append(queue.count)
        case "empty":
        result.append(queue.isEmpty ? 1 : 0)
        case "front":
        result.append(queue.first ?? -1)
        case "back":
        result.append(queue.last ?? -1)
        default:
        break
    }
}

result.forEach { print($0) }
