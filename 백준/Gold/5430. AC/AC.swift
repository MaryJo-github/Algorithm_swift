import Foundation

let t = Int(readLine()!)!
var totalResult = [String]()

for _ in 0..<t {
    let p = readLine()!
    _ = Int(readLine()!)!
    let a = readLine()!.trimmingCharacters(in: ["[","]"]).split(separator: ",").map { String($0) }

    totalResult.append(test(p, a))
}

totalResult.forEach { print($0) }

func test(_ p: String, _ a: [String]) -> String {
    var isReversed = false
    var start = 0
    var end = a.count - 1

    for c in p {
        switch c {
            case "R":
            isReversed.toggle()
            case "D":
            if isReversed {
                end -= 1
            } else {
                start += 1
            }
            if start > end + 1 {
                return "error"
            }
            default:
            continue
        }
    }

    var result = [String]()
    let stride = isReversed ? stride(from: end, through: start, by: -1) : stride(from: start, through: end, by: 1)
    for i in stride {
        result.append(a[i])
    }

    return "[" + result.joined(separator: ",") + "]"
}