let n = Int(readLine()!)!
var graph = [[Int]]()
var visited = Array(repeating: Array(repeating: false, count: n), count: n)
var result = 200

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph.append(line)
}

for i in 0..<n {
    for j in 0..<n {
        if visited[i][j] == false && graph[i][j] == 1 {
            // 섬 찾기
            let side = findIsland(start: (i, j))
            // 해당 섬에서 최소 다리길이 찾기
            result = min(findMinLength(side: side), result)
        }
    }
}

print(result)

func findIsland(start: (Int, Int)) -> [(Int, Int, Int)] {
    var willVisit = [start]
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var side = [(Int, Int, Int)]()

    while willVisit.isEmpty == false {
        let k = willVisit.removeLast()

        if visited[k.0][k.1] == false {
            visited[k.0][k.1] = true

            for i in 0..<4 {
                let x = k.0 + dx[i]
                let y = k.1 + dy[i]

                guard x>=0 && x<n && y>=0 && y<n else { continue }
                guard visited[x][y] == false else { continue }
                if graph[x][y] == 1 {
                    willVisit.append((x,y))
                } else {
                    side.append((x,y,1))
                }
            }
        }
    }
    return side
}

func findMinLength(side: [(Int, Int, Int)]) -> Int {
    var newVisited = visited
    var willVisit = side
    var pointer = 0
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]

    while willVisit.count > pointer {
        let k = willVisit[pointer]
        pointer += 1

        if newVisited[k.0][k.1] == false {
            newVisited[k.0][k.1] = true

            for i in 0..<4 {
                let x = k.0 + dx[i]
                let y = k.1 + dy[i]

                guard x>=0 && x<n && y>=0 && y<n else { continue }
                guard newVisited[x][y] == false else { continue }
                if graph[x][y] == 0 {
                    willVisit.append((x,y,k.2+1))
                } else if graph[x][y] == 1 {
                    return k.2
                }
            }
        }
    }

    return 200
}