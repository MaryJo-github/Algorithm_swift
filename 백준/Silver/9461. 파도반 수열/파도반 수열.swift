let t = Int(readLine()!)!
var result = ""
var dp = [1, 1, 1, 2, 2, 3]

for _ in 0..<t {
    let n = Int(readLine()!)!
    result += "\(spiralTriangle(n))\n"
}

print(result)

func spiralTriangle(_ n: Int) -> Int {
    guard n > dp.count else { return dp[n-1] }

    for i in dp.count..<n {
        dp.append(dp.last!+dp[i-5])
    }
    return dp[n-1]
}