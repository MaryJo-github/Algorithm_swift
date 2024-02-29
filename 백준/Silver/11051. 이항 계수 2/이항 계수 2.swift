let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = numbers[0]
let k = numbers[1]
var dp = Array(repeating: Array(repeating: 1, count: n+1), count: n+1)

for i in 1...n {
    for j in 1..<i {
        dp[i][j] = (dp[i-1][j] + dp[i-1][j-1]) % 10007
    }
}

print(dp[n][k])