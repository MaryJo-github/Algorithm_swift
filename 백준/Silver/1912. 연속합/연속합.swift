let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = Array(repeating: 0, count: n)

dp[0] = array[0]
for i in 1..<n {
    dp[i] = max(dp[i-1]+array[i], array[i])
}

print(dp.max()!)