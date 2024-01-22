let n = Int(readLine()!)!
var consulting = [(Int, Int)]()
var dp = Array(repeating: 0, count: n+1)

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    consulting.append((line[0], line[1]))
}

for i in stride(from: n-1, through: 0, by: -1) {
    let dayAfterEnd = i + consulting[i].0
    if dayAfterEnd > n {
        dp[i] = dp[i+1]
    } else {
        dp[i] = max(dp[i+1], consulting[i].1 + dp[dayAfterEnd])
    }
}

print(dp[0])