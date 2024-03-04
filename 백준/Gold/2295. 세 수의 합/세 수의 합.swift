let n = Int(readLine()!)!
var array = [Int]()
var two = Set<Int>()
var result = 0

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}
array.sort()

for i in 0..<n {
    for j in i..<n {
        two.insert(array[i] + array[j])
    }
}

for i in stride(from: n-1, through: 0, by: -1) {
    for j in stride(from: n-1, through: 0, by: -1) {
        if two.contains(array[i]-array[j]) {
            result = array[i]
            break
        }
    }
    if result != 0 { break }
}

print(result)