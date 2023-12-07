let size = readLine()!.split(separator: " ").compactMap { Int($0) }
var graph = [[Int]]()
let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

for _ in 0..<size[0] {
    let line = readLine()!.compactMap { Int(String($0)) }
    graph.append(line)
}

print(bfs())

func bfs() -> Int {
    var visited = Array(repeating: Array(repeating: [0, 0], count: size[1]), count: size[0])
    var willVisit = [(0, 0, 0)]
    var pointer = 0

    visited[0][0][0] = 1

    while willVisit.count > pointer {
        let k = willVisit[pointer]
        pointer += 1

        if k.0 == size[0]-1 && k.1 == size[1]-1 {
            return visited[k.0][k.1][k.2]
        }

        for i in 0..<dx.count {
            let x = k.0 + dx[i]
            let y = k.1 + dy[i]

            guard x>=0 && x<size[0] && y>=0 && y<size[1] else { continue }
            if graph[x][y] == 1 && k.2 == 0 {
                visited[x][y][1] = visited[k.0][k.1][0] + 1
                willVisit.append((x,y,1))
            } else if graph[x][y] == 0 && visited[x][y][k.2] == 0 {
                visited[x][y][k.2] = visited[k.0][k.1][k.2] + 1
                willVisit.append((x,y,k.2))
            }
        }
    }

    return -1
}