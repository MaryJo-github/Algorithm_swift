let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: Array(repeating: (Int.max-1)/2, count: n), count: n)

for i in 0..<n {
    graph[i][i] = 0
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]-1][input[1]-1] = min(input[2], graph[input[0]-1][input[1]-1])
}

for k in 0..<n {
    for s in 0..<n {
        for t in 0..<n {
            guard s != t else { continue }
            let sumValue = graph[s][k] + graph[k][t]
            if sumValue < graph[s][t] {
                graph[s][t] = sumValue
            }
        }
    }
}

for i in 0..<n {
    for j in 0..<n {
        if graph[i][j] == (Int.max-1)/2 {
            graph[i][j] = 0
        }
    }
}

graph.forEach { array in
               print(array.map { String($0) }.joined(separator: " "))
              }