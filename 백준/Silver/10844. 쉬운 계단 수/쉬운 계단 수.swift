let n = Int(readLine()!)!
var dp = Array(repeating: Array(repeating: 0, count: 10), count: n)

dp[0] = [0, 1, 1, 1, 1, 1, 1, 1, 1, 1]
for i in 1..<n {
    for j in 0..<10 {
        switch j {
            case 0:
            dp[i][j] = dp[i-1][1] % 1000000000
            case 9:
            dp[i][j] = dp[i-1][8] % 1000000000
            default:
            dp[i][j] = (dp[i-1][j-1] + dp[i-1][j+1]) % 1000000000
        }
    }
}

print(dp[n-1].reduce(0, +) % 1000000000)