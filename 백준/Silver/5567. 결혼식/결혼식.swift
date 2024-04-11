let n = Int(readLine()!)!
let m = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n)
var result = 0

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]-1].append(input[1]-1)
    graph[input[1]-1].append(input[0]-1)
}

bfs(start: 0)
print(result)

func bfs(start: Int) {
    var visited = Array(repeating: false, count: n)
    var willVisit = [(friend: Int, depth: Int)]()
    var pointer = 0

    graph[start].forEach {
        willVisit.append((friend: $0, depth: 1))
    }
    visited[start] = true

    while willVisit.count > pointer {
        let node = willVisit[pointer]
        pointer += 1

        if !visited[node.friend] {
            visited[node.friend] = true
            result += 1

            guard node.depth < 2 else { continue }
            for element in graph[node.friend] where !visited[element] {
                willVisit.append((friend: element, depth: node.depth + 1))
            }
        }
    }
}