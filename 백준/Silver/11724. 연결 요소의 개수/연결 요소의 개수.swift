let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)
var result = 0

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[uv[0]-1].append(uv[1]-1)
    graph[uv[1]-1].append(uv[0]-1)
}

for i in 0..<n {
    if !visited[i] {
        dfs(start: i)
        result += 1
    }
}

print(result)

func dfs(start: Int) {
    visited[start] = true

    for node in graph[start] where visited[node] == false {
        dfs(start: node)
    }
}