var testNumber = 1
var result = ""

while let n = Int(readLine()!), n != 0 {
    result += "\(testNumber). \(calculate(n))\n"
    testNumber += 1
}

print(result)

func calculate(_ n: Int) -> Int {
    var graph = [[Int]]()

    for _ in 0..<n {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph.append(line)
    }

    var dp = Array(repeating: Array(repeating: 1000, count: 3), count: n)
    dp[n-1][0] = graph[n-1][0] + graph[n-1][1]
    dp[n-1][1] = graph[n-1][1]

    for i in 2...n {
        let before = n - i + 1
        let current = n - i
        dp[current][2] = min(dp[before][1], dp[before][2]) + graph[current][2]
        dp[current][1] = min(dp[before][0], dp[before][1], dp[before][2], dp[current][2]) + graph[current][1]
        dp[current][0] = min(dp[before][0], dp[before][1], dp[current][1]) + graph[current][0]
    }

    return dp[0][1]
}