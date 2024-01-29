let line = readLine()!.split(separator: " ").compactMap { Int($0) }
var array = [Int]()
var dp = Array(repeating: Array(repeating: [0, 0], count: line[1]+1), count: line[0])

for _ in 0..<line[0] {
    array.append(Int(readLine()!)!)
}

for i in 0..<line[0] {
    guard i != 0 else {
        if array[i] == 1 {
            dp[i][0][0] = 1 // 안움직이고 먹음
        } else {
            dp[i][1][1] = 1 // 움직여서 먹음
        }
        continue
    }

    if array[i] == 1 {
        for w in 0...line[1] {
            if w == 0 {
                dp[i][w][0] = dp[i-1][w][0] + 1
                dp[i][w][1] = dp[i-1][w][1]
            } else {
                dp[i][w][0] = max(dp[i-1][w][0], dp[i-1][w-1][1]) + 1
                dp[i][w][1] = max(dp[i-1][w][1], dp[i-1][w-1][0])
            }
        }
    } else {
        for w in 0...line[1] {
            if w == 0 {
                dp[i][w][0] = dp[i-1][w][0]
                dp[i][w][1] = dp[i-1][w][1] + 1
            } else {
                dp[i][w][0] = max(dp[i-1][w][0], dp[i-1][w-1][1])
                dp[i][w][1] = max(dp[i-1][w][1], dp[i-1][w-1][0]) + 1
            }
        }
    }
}

var result = -1
for w in 0...line[1] {
    result = max(result, max(dp[line[0]-1][w][0], dp[line[0]-1][w][1]))
}
print(result)