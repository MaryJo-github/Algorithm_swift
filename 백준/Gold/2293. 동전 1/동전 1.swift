let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = line[0]
let k = line[1]
var array = [Int]()
var dp = Array(repeating: 0.0, count: k+1)

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}
dp[0] = 1

for value in array {
    guard value <= k else { continue }
    for j in value...k {
        dp[j] += dp[j-value]
    }
}

print(Int(dp[k]))