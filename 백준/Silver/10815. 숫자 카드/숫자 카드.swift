let n = Int(readLine()!)!
let nums = readLine()!.split(separator: " ").compactMap { Int($0) }
let numsSet = Set(nums)
let m = Int(readLine()!)!
let targetNums = readLine()!.split(separator: " ").compactMap { Int($0) }
var result: [String] = []

for num in targetNums {
    result.append(numsSet.contains(num) ? "1" : "0")
}

print(result.joined(separator: " "))