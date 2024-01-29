let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = array.map { (1, [$0]) }

for i in 0..<n {
    for j in 0..<i {
        if array[i] > array[j], dp[i].0 < dp[j].0 + 1 {
            dp[i].0 = dp[j].0 + 1
            dp[i].1 = dp[j].1 + [array[i]]
        }
    }
}

var result = (0, [Int]())
for i in 0..<n {
    if result.0 < dp[i].0 {
        result = dp[i]
    }
}
print(result.0)
print(result.1.map { String($0) }.joined(separator: " "))