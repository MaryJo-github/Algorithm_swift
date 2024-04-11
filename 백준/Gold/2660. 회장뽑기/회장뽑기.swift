let n = Int(readLine()!)!
var graph = Array(repeating: [Int](), count: n)
var scores = Array(repeating: 0, count: n)

while let input = readLine(),
input.first != "-" {
    let line = input.split(separator: " ").compactMap { Int($0) }
    graph[line[0]-1].append(line[1]-1)
    graph[line[1]-1].append(line[0]-1)
}

for i in 0..<n {
    scores[i] = bfs(start: i)
}

let minScore = scores.min()!
var candidates = [Int]()
for i in 0..<n {
    if scores[i] == minScore {
        candidates.append(i+1)
    }
}

print("\(minScore) \(candidates.count)")
print(candidates.map { String($0) }.joined(separator: " "))

func bfs(start: Int) -> Int {
    guard !graph[start].isEmpty else { return 0 }
    var visited = Array(repeating: -1, count: n)
    var willVisit = [(Int, d: Int)]()
    var pointer = 0

    graph[start].forEach { element in
                          willVisit.append((element, d: 1))
                         }
    visited[start] = 0

    while willVisit.count > pointer {
        let node = willVisit[pointer]
        pointer += 1

        if visited[node.0] == -1 {
            visited[node.0] = node.d

            for element in graph[node.0] where visited[element] == -1 {
                willVisit.append((element, node.d + 1))
            }
        }
    }

    return visited.min()! == -1 ? 0 : visited.max()!
}