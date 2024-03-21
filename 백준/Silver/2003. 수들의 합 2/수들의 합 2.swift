let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
let array = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = 0

for i in 0..<n{
    var sum = 0
    for j in i..<n{
        sum += array[j]
        if sum == m{
            result += 1
        }
    }
}

print(result)