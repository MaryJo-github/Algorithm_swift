let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let tree = readLine()!.split(separator: " ").compactMap { Int($0) }

print(findMaxTreeLength())

func findMaxTreeLength() -> Int {
    var start = 0
    var end = tree.max()!
    var result = 0

    while start <= end {
        var sum = 0
        let mid = (start + end) / 2

        for i in 0..<nm[0] {
            if mid < tree[i] {
                sum += tree[i] - mid
            }
        }

        if sum < nm[1] {
            end = mid - 1
        } else {
            result = mid
            start = mid + 1
        }
    }

    return result
}