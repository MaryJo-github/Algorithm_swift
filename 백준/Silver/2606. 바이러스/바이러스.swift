let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)
var result = -1

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]-1].append(input[1]-1)
    graph[input[1]-1].append(input[0]-1)
}

dfs(start: 0)
print(result)

func dfs(start: Int) {
    result += 1
    visited[start] = true

    for element in graph[start] where !visited[element] {
        dfs(start: element)
    }
}