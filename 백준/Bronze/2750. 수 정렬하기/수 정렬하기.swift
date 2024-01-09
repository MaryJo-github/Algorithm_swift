let n = Int(readLine()!)!
var array = [Int]()

for _ in 0..<n {
    array.append(Int(readLine()!)!)
}

array.sort()
array.forEach { print($0) }