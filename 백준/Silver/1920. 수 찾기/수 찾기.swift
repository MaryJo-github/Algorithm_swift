_ = Int(readLine()!)!
let a = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
_ = Int(readLine()!)!
let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = ""

for number in numbers {
    result += "\(binarySearch(number))\n"
}

print(result)

func binarySearch(_ n: Int) -> Int {
    var start = 0
    var end = a.count-1

    while start <= end {
        let mid = (start + end) / 2

        if n < a[mid] {
            end = mid - 1
        } else if n > a[mid] {
            start = mid + 1
        } else {
            return 1
        }
    }

    return 0
}