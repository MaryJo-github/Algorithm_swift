let n = Int(readLine()!)!
var array = [Int]()
var dp = Array(repeating: [0, 0, 0], count: n)

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

dp[0][1] = array[0]
if n > 1 {
    dp[1][0] = array[0]
    dp[1][1] = array[1]
    dp[1][2] = array[0] + array[1]
    for i in 2..<n {
        dp[i][0] = max(dp[i-1][0], dp[i-1][1], dp[i-1][2])
        dp[i][1] = array[i] + max(dp[i-2][1], dp[i-2][2])
        if i == 2 {
            dp[i][2] = array[i] + array[i-1]
        } else {
            dp[i][2] = array[i] + array[i-1] + max(dp[i-3][0], dp[i-3][1], dp[i-3][2])
        }
    }
}

print(dp.flatMap({ $0 }).max()!)