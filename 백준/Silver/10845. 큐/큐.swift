let n = Int(readLine()!)!
var queue = Array(repeating: "", count: n)
var result = [String]()
var head = 0
var tail = -1

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0) }

    switch input.first {
        case "push":
        queue[(tail+1)%n] = input.last!
        tail += 1
        case "pop":
        if head > tail {
            result.append("-1")
        } else {
            result.append(queue[head%n])
            head += 1
        }
        case "size":
        result.append(String(tail-head+1))
        case "empty":
        result.append(head > tail ? "1" : "0")
        case "front":
        result.append(head > tail ? "-1" : queue[head%n])
        case "back":
        result.append(head > tail ? "-1" : queue[tail%n])

        default:
        break
    }
}

result.forEach { print($0) }