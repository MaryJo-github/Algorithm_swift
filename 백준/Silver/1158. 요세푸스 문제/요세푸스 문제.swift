let input = readLine()!.split(separator: " ").map { Int($0)! }
var array = Array(repeating: 0, count: input[0])
(0..<input[0]).forEach { array[$0] = $0 + 1 }
var result = [Int]()
var start = 0

for _ in 0..<input[0] {
    let index = (start + input[1] - 1) % array.count
    result.append(array.remove(at: index))
    start = index
}

print("<\(result.map { String($0) }.joined(separator: ", "))>")