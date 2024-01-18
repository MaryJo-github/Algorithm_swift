let n = Int(readLine()!)!
var dp = Array(repeating: 0, count: n+1)

dp[1] = 1
if n > 1 {
    for i in 2...n {
        if i % 2 == 0 {
            dp[i] = dp[i-1] * 2 + 1
        } else {
            dp[i] = dp[i-1] * 2 - 1
        }
        dp[i] %= 10007
    }
}
print(dp[n])