let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    result += "\(sticker())\n"
}

print(result)

func sticker() -> Int {
    let n = Int(readLine()!)!
    var stickers = [[Int]]()
    var dp = Array(repeating: Array(repeating: [0, 0], count: n), count: 2)

    for _ in 0..<2 {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        stickers.append(line)
    }

    dp[0][0][1] = stickers[0][0]
    dp[1][0][1] = stickers[1][0]

    if n > 1 {
        for i in 1..<n {
            for j in 0..<2 {
                let opposite = j == 0 ? 1 : 0
                let maxValue = max(dp[0][i-1][0], dp[1][i-1][0], dp[opposite][i-1][1])
                dp[j][i][0] = maxValue
                dp[j][i][1] = maxValue + stickers[j][i]
            }
        }
    }

    return max(dp[0][n-1][0], dp[0][n-1][1], dp[1][n-1][0], dp[1][n-1][1])
}