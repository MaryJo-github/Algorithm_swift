let n = Int(readLine()!)!
var array = [0]
var dp = Array(repeating: [0, 0], count: n+1) // [1번연속했을때합, 2번연속했을때합]

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

print(calculation())

func calculation() -> Int {
    if n == 1 { return array[n] }
    if n == 2 { return array[n-1] + array[n] }

    dp[1][0] = array[1]
    dp[2][0] = array[2]
    dp[2][1] = array[1] + array[2]
    for i in 3...n {
        dp[i][0] = max(dp[i-2][0], dp[i-2][1]) + array[i]
        dp[i][1] = dp[i-1][0] + array[i]
    }

    return max(dp[n][0], dp[n][1])
}