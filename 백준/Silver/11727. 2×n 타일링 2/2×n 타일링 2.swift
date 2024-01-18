let n = Int(readLine()!)!
var dp = Array(repeating: 1, count: n+1)

if n > 1 {
    for i in 2...n {
        dp[i] = (dp[i-1] + (dp[i-2] * 2)) % 10007
    }
}
print(dp[n])