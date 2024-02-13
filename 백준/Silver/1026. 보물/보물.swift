let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").compactMap { Int($0) }
var b = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = 0

a.sort(by: >)
b.sort(by: <)

for i in 0..<n {
    result += a[i] * b[i]
}

print(result)