let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n)
var score = Int.max
var winner = 0

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0] - 1].append(input[1] - 1)
    graph[input[1] - 1].append(input[0] - 1)
}

for i in 0..<n {
    let temp = bfs(start: i)

    if score > temp {
        score = temp
        winner = i
    }
}

print(winner + 1)

func bfs(start: Int) -> Int {
    var visited = Array(repeating: false, count: n)
    var willVisit = [(user: start, depth: 0)]
    var result = 0
    var pointer = 0

    while willVisit.count > pointer {
        let node = willVisit[pointer]
        pointer += 1

        if !visited[node.user] {
            visited[node.user] = true
            result += node.depth

            for friend in graph[node.user] {
                guard !visited[friend] else { continue }

                willVisit.append((friend, node.depth + 1))
            }
        }
    }

    return result
}