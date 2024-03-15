let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").compactMap { Int($0) }.sorted()
var result = 0

for i in 0..<n-1 {
    for j in i+1..<n {
        let value = (array[i] + array[j]) * (-1)
        let firstIndex = findFirstIndex(value, start: j+1, end: array.count-1)
        let lastIndex = findLastIndex(value, start: j+1, end: array.count-1)

        if let firstIndex = firstIndex, let lastIndex = lastIndex {
            result += lastIndex - firstIndex + 1
        } 
    }
}

print(result)

func findFirstIndex(_ v: Int, start: Int, end: Int) -> Int? {
    var start = start
    var end = end
    var result: Int?

    while start <= end {
        let mid = (start + end) / 2
        if array[mid] > v {
            end = mid - 1
        } else if array[mid] < v {
            start = mid + 1
        } else {
            result = mid
            end = mid - 1
        }
    }

    return result
}

func findLastIndex(_ v: Int, start: Int, end: Int) -> Int? {
    var start = start
    var end = end
    var result: Int?

    while start <= end {
        let mid = (start + end) / 2
        if array[mid] > v {
            end = mid - 1
        } else if array[mid] < v {
            start = mid + 1
        } else {
            result = mid
            start = mid + 1
        }
    }

    return result
}