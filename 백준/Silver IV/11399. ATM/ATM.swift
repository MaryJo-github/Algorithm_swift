let n = Int(readLine()!)!
var p = readLine()!.split(separator: " ").compactMap { Int($0) }
var pre = 0
var result = 0

p.sort()

for i in 0..<n {
    pre += p[i]
    result += pre
}

print(result)