let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
var a = [Int]()

for _ in 0..<nm[0] {
    a.append(Int(readLine()!)!)
}

a.sort()

print(findMinDiff(array: a, minimum: nm[1]))

func findMinDiff(array: [Int], minimum: Int) -> Int {
    var start = 0
    var end = 0
    var diff = Int.max

    while start <= end {
        guard start < array.count,
        end < array.count else { break }

        let d = abs(array[start] - array[end])

        if d >= minimum{
            diff = min(diff, d)
            start += 1
        } else {
            end += 1
        }
    }

    return diff
}