let input = readLine()!
let m = Int(readLine()!)!
var left = input
var right = [Character]()

for _ in 0..<m {
    let command = readLine()!
    process(command: command)
}

print(left + right.reversed())

func process(command: String) {
    switch command.first {
        case "L":
        if left.isEmpty == false {
            right.append(left.popLast()!)
        }
        case "D":
        if right.isEmpty == false {
            left.append(right.popLast()!)
        }
        case "B":
        if left.isEmpty == false {
            _ = left.popLast()!
        }
        case "P":
        left.append(command.last!)
        default:
        print("error")
    }
}