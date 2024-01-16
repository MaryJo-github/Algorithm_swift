let n = Int(readLine()!)!
var triangle = [[Int]]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    triangle.append(line)
}

if n > 1 {
    for i in 0...n-2 {
        let floor = n-i-2
        for j in 0..<floor+1 {
            triangle[floor][j] += max(triangle[floor+1][j], triangle[floor+1][j+1])
        }
    }
}
print(triangle[0][0])