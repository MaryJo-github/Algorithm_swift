let n = Int(readLine()!)!
var array = [Int]()
var two = [Int]()
var result = 0

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}
array.sort()

for i in 0..<n {
    for j in i..<n {
        two.append(array[i] + array[j])
    }
}
two.sort()

for i in stride(from: n-1, through: 0, by: -1) {
    for j in stride(from: n-1, through: 0, by: -1) {
        if isExist(array[i]-array[j], in: two) {
            result = array[i]
            break
        }
    }
    if result != 0 { break }
}

print(result)

func isExist(_ n: Int, in array: [Int]) -> Bool {
    var start = 0
    var end = array.count - 1

    while start < end {
        let mid = (start + end) / 2

        if n > array[mid] {
            start = mid + 1
        } else if n < array[mid] {
            end = mid - 1
        } else {
            return true
        }
    }

    return false
}