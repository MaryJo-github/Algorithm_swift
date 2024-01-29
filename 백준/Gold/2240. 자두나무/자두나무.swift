let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let t = line[0]
let w = line[1]
var array = [0]
var dp = Array(repeating: Array(repeating: 0, count: w+1), count: t+1)

for _ in 0..<t {
    array.append(Int(readLine()!)!)
}

for i in 1...t {
    dp[i][0] = dp[i-1][0] + (array[i] == 1 ? 1 : 0)
}

for i in 1...t {
    for j in 1...w {
        dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + (j % 2 + 1 == array[i] ? 1 : 0)
    }
}

print(dp[t].max()!)