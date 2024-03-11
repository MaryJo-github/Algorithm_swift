let mn = readLine()!.split(separator: " ").compactMap { Int($0) }
let snacks = readLine()!.split(separator: " ").compactMap { Int($0) }

print(binarySearch(max: snacks.max()!))

func binarySearch(max: Int) -> Int {
    var start = 0
    var end = max
    var result = 0

    while start <= end {
        let mid = (start + end) / 2
        var count = 0

        snacks.forEach {
            count += $0/(mid == 0 ? 1 : mid)
        }

        if count >= mn[0] {
            result = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }

    return result
}