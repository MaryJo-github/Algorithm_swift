let t = Int(readLine()!)!
var result = ""
var dp = [0, 1, 2, 4]
for i in 4...10 {
    dp.append(dp[i-1] + dp[i-2] + dp[i-3])
}

for _ in 0..<t {
    let n = Int(readLine()!)!
    result += "\(dp[n])\n"
}
print(result)