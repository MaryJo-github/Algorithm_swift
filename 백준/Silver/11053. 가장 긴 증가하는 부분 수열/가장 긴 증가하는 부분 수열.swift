let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = Array(repeating: 1, count: n)

for i in 0..<n {
    for j in 0..<i {
        if array[j] < array[i] {
            dp[i] = max(dp[i], dp[j] + 1)
        }
    }
}

print(dp.max()!)