let n = Int(readLine()!)!
let p = [0] + readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = p

for i in 1...n {
    for j in 0...i {
        dp[i] = max(dp[i], dp[j] + p[i-j])
    }
}

print(dp[n])