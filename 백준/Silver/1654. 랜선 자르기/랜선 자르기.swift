let kn = readLine()!.split(separator: " ").compactMap { Int($0) }
var lans = [Int]()

for _ in 0..<kn[0] {
    lans.append(Int(readLine()!)!)
}

print(binarySearch(n: kn[1], max: lans.reduce(0, +)/kn[1]))

func binarySearch(n: Int, max: Int) -> Int {
    var start = 0
    var end = max
    var result = 0

    while start <= end {
        let mid = (start + end) / 2
        var count = 0

        lans.forEach {
            count += $0/(mid == 0 ? 1 : mid)
        }

        if count >= n {
            result = mid
            start = mid + 1
        } else {
            end = mid - 1
        }
    }

    return result
}