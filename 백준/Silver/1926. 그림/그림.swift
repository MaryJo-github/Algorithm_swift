let size = readLine()!.split(separator: " ").compactMap { Int($0) }
var graph = [[Int]]()

for _ in 0..<size[0] {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph.append(line)
}

var visited = Array(repeating: Array(repeating: false, count: size[1]), count: size[0])
var max = 0
var count = 0

for i in 0..<size[0] {
    for j in 0..<size[1] {
        if graph[i][j] == 1 && visited[i][j] == false{
            let result = dfs(start: (i, j))

            if max < result {
                max = result
            }
            count += 1
        }
    }
}

print("\(count)\n\(max)")

func dfs(start: (Int, Int)) -> Int {
    var willVisit = [(Int, Int)]()
    var r = 0

    willVisit.append((start.0, start.1))

    while willVisit.isEmpty == false {
        let x = willVisit.popLast()!

        if graph[x.0][x.1] == 1 && visited[x.0][x.1] == false {
            visited[x.0][x.1] = true
            r += 1

            if x.0+1 < size[0] && graph[x.0+1][x.1] == 1 && visited[x.0+1][x.1] == false {
                willVisit.append((x.0+1, x.1))
            }
            if x.1+1 < size[1] && graph[x.0][x.1+1] == 1 && visited[x.0][x.1+1] == false {
                willVisit.append((x.0, x.1+1))
            }
            if x.0-1 >= 0 && graph[x.0-1][x.1] == 1 && visited[x.0-1][x.1] == false {
                willVisit.append((x.0-1, x.1))
            }
            if x.1-1 >= 0 && graph[x.0][x.1-1] == 1 && visited[x.0][x.1-1] == false {
                willVisit.append((x.0, x.1-1))
            }
        }
    }
    return r
}