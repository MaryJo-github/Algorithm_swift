_ = Int(readLine()!)!
var solutions = readLine()!.split(separator: " ").compactMap { Int($0) }
var min = Int.max
var result = (0, 0)

while solutions.count >= 2 {
    let target = solutions.popLast()!
    var start = 0
    var end = solutions.count - 1

    while start <= end {
        let mid = (start + end) / 2
        let absSum = abs(target + solutions[mid])

        if absSum < min {
            min = absSum
            result = (solutions[mid], target)
        }
        if target + solutions[mid] > 0 {
            end = mid - 1
        } else {
            start = mid + 1
        }
    }
}

print("\(result.0) \(result.1)")