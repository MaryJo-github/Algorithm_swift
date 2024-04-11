let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n)
var result = Array(repeating: Array(repeating: 0, count: n), count: n)

for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for j in 0..<n {
        if input[j] == 1 {
            graph[i].append(j)
        }
    }
}

for i in 0..<n {
    for element in graph[i] where result[i][element] == 0 {
        dfs(row: i, start: element)
    }
}

result.forEach {
    print($0.map { String($0) }.joined(separator: " "))
}

func dfs(row: Int, start: Int) {
    result[row][start] = 1

    for element in graph[start] where result[row][element] == 0 {
        dfs(row: row, start: element)
    }
}