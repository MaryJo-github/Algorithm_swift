let n = Int(readLine()!)!
var dp = Array(repeating: 1, count: 10)

for _ in 0..<n-1 {
    var sum = dp.reduce(0, +)
    var newDp = dp
    for i in 0..<10 {
        if i != 0 {
            sum -= dp[i-1]
        }
        newDp[i] = sum % 10007
    }
    dp = newDp
}

print(dp.reduce(0, +) % 10007)