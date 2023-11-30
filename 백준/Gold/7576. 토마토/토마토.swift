토마토()

func 토마토() {
    let size = readLine()!.split(separator: " ").compactMap { Int($0) }
    var graph = [[Int]]()
    
    for _ in 0..<size[1] {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        
        graph.append(line)
    }
    
    var visited = Array(repeating: Array(repeating: false, count: size[0]), count: size[1])
    var willVisit = [(Int, Int, Int)]()
    var start = 0
    
    if graph.flatMap({ $0 }).filter({ $0 == 1 }).count == size[0]*size[1] {
        print(0)
        return
    }

    for i in 0..<size[1] {
        for j in 0..<size[0] {
            if graph[i][j] == 1 {
                willVisit.append((i, j, 0))
            }
            if graph[i][j] == -1 {
                visited[i][j] = true
            }
        }
    }
    
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]
    var day = 0
    
    while willVisit.count > start {
        let k = willVisit[start]
        start += 1
        
        if visited[k.0][k.1] == false {
            visited[k.0][k.1] = true
            if day < k.2 {
                day = k.2
            }
            
            for i in 0..<4 {
                let x = k.0 + dx[i]
                let y = k.1 + dy[i]
                
                guard x >= 0 && x < size[1] && y >= 0 && y < size[0] else { continue }
                if visited[x][y] == false && graph[x][y] != -1 {
                    willVisit.append((x, y, k.2+1))
                }
            }
        }
    }
    
    if visited.map({ $0.reduce(true, { $0 && $1 }) }).reduce(true, { $0 && $1 }) {
        print(day)
    } else {
        print(-1)
    }
}