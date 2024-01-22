let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").compactMap { Int($0) }
var dp = array

for i in 0..<n {
    for j in 0..<i {
        if array[j] < array[i] {
            dp[i] = max(dp[i], dp[j] + array[i])
        }
    }
}

print(dp.max()!)