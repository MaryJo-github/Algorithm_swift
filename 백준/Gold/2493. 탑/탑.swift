let n = Int(readLine()!)!
let height = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var receivers = Array(repeating: 0, count: n)
var stack = [[Int]]()

for i in (0..<n).reversed() {
    while !stack.isEmpty && stack.last![1] < height[i] {
        receivers[stack.removeLast()[0]] = i + 1
    }
    stack.append([i, height[i]])
}

print(receivers.map { String($0) }.joined(separator: " "))