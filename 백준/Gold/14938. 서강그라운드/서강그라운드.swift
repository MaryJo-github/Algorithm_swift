let nmr = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nmr[0], m = nmr[1], r = nmr[2]
let items = readLine()!.split(separator: " ").compactMap { Int($0) }
let maxValue = 15*(100-1)+1
var graph = Array(repeating: Array(repeating: maxValue, count: n), count: n)

for i in 0..<n {
    graph[i][i] = 0
}

for _ in 0..<r {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]-1][input[1]-1] = input[2]
    graph[input[1]-1][input[0]-1] = input[2]
}

for k in 0..<n {
    for s in 0..<n {
        for t in 0..<n {
            graph[s][t] = min(graph[s][t], graph[s][k] + graph[k][t])
        }
    }
}

var result = 0
for i in 0..<n {
    var sumItems = 0
    for j in 0..<n {
        if graph[i][j] <= m {
            sumItems += items[j]
        }
    }
    result = max(result, sumItems)
}
print(result)