let n = Int(readLine()!)!
var tree = Array(repeating: [Int](), count: n)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    tree[input[0] - 1].append(input[1] - 1)
    tree[input[1] - 1].append(input[0] - 1)
}

let result = bfs(start: 0).compactMap { String($0) }.joined(separator: "\n")
print(result)

func bfs(start: Int) -> [Int] {
    var pointer = 0
    var parent = Array(repeating: 0, count: n)
    var visited = Array(repeating: false, count: n)
    var willVisit = [start]
    visited[start] = true

    while willVisit.count > pointer {
        let node = willVisit[pointer]
        pointer += 1

        for child in tree[node] where !visited[child] {
            parent[child] = node + 1
            willVisit.append(child)
            visited[child] = true
        }
    }

    parent.removeFirst()
    return parent
}