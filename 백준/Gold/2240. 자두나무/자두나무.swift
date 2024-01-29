let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let t = line[0]
let w = line[1]
var array = [0]
var dp = Array(repeating: Array(repeating: 0, count: w+1), count: t+1)

for _ in 0..<line[0] {
    array.append(Int(readLine()!)!)
}

// 한 번도 움직이지 않았을 때
for i in 1...t {
    dp[i][0] = dp[i-1][0] + (array[i] == 1 ? 1 : 0)
}

// 움직였을 때
for i in 1...t {
    for j in 1...w {
        // 이전에 이동을 안했거나 했거나 + 이동횟수 짝수면 1번나무아래에 있고, 홀수면 2번나무아래에 있음
        dp[i][j] = max(dp[i-1][j-1], dp[i-1][j]) + (j % 2 + 1 == array[i] ? 1 : 0)
    }
}

print(dp[t].max()!)