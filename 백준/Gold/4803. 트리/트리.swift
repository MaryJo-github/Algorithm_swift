var caseNumber = 0
var result = ""

while let nm = readLine()?.split(separator: " ").compactMap({ Int($0) }),
nm[0] != 0 || nm[1] != 0 {
    let n = nm[0]
    let m = nm[1]
    var graph = Array(repeating: [Int](), count: n)

    for _ in 0..<m {
        let input = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph[input[0] - 1].append(input[1] - 1)
        graph[input[1] - 1].append(input[0] - 1)
    }

    caseNumber += 1
    let foundTrees = findNumberOfTrees(n: n, graph: graph)
    switch foundTrees {
        case 0:
        result += "Case \(caseNumber): No trees.\n"
        case 1:
        result += "Case \(caseNumber): There is one tree.\n"
        default:
        result += "Case \(caseNumber): A forest of \(foundTrees) trees.\n"
    }
}

print(result)

func findNumberOfTrees(n: Int, graph: [[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var isTree = true
    var count = 0

    func dfs(cur: Int, prev: Int) {
        for next in graph[cur] {
            if next == prev {
                continue
            }
            if visited[next] {
                isTree = false
                break
            }
            visited[next] = true
            dfs(cur: next, prev: cur)
        }
    }

    for i in 0..<n {
        if visited[i] { continue }
        visited[i] = true
        isTree = true
        dfs(cur: i, prev: -1)
        if isTree { count += 1 }
    }

    return count
}