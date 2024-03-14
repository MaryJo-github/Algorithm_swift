let ns = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = ns[0]
let s = ns[1]
let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
var end = 0
var result = Int.max
var sum = nums[0]

for start in 0..<n {
    while end < n, sum < s {
        end += 1
        if end != n {
            sum += nums[end]
        }
    }
    if end == n { break }
    result = min(result, end - start + 1)
    sum -= nums[start]
}

result == Int.max ? print(0) : print(result)