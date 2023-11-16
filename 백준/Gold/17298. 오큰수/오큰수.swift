let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var stack = [[Int]]()
var result = Array(repeating: -1, count: n)

for i in 0..<n {
    while !stack.isEmpty && stack.last![1] < a[i] {
        result[stack.removeLast()[0]] = a[i]
    }
    stack.append([i, a[i]])
}

print(result.map { String($0) }.joined(separator: " "))