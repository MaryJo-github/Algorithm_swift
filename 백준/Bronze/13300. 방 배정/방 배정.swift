let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
let row = Array(repeating: 0, count: 6)
var array = [row, row]
var result = 0

for _ in 0..<n {
    let student = readLine()!.split(separator: " ").map { Int($0)! }
    array[student[0]][student[1]-1] += 1
}

for i in 0..<array.count {
    for j in 0..<array[0].count {
        result += (array[i][j] + k - 1)/k
    }
}

print(result)