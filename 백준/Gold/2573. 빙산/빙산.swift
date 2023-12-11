빙산()
func 빙산() {
    let size = readLine()!.split(separator: " ").compactMap { Int($0) }
    var graph = [[Int]]()
    var year = 0
    
    for _ in 0..<size[0] {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph.append(line)
    }
    
    while graph.flatMap({ $0 }).reduce(0, +) != 0 {
        var visited = Array(repeating: Array(repeating: false, count: size[1]), count: size[0])
        var flag = false
        var result = (graph, visited)
        
        for i in 1..<size[0] {
            for j in 1..<size[1] {
                if visited[i][j] == false && graph[i][j] != 0 {
                    if flag {
                        print(year)
                        return
                    }
                    result = dfs(start: (i,j), visited: visited)
                    visited = result.1
                    flag = true
                }
            }
        }
        graph = result.0
        year += 1
    }
    
    print(0)
    
    func dfs(start: (Int, Int), visited: [[Bool]]) -> ([[Int]], [[Bool]]) {
        var newGraph = graph
        var newVisited = visited
        var willVisit = [start]
        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]
        
        while willVisit.isEmpty == false {
            let k = willVisit.removeLast()
            
            if newVisited[k.0][k.1] == false {
                newVisited[k.0][k.1] = true
                
                var count = 0
                for i in 0..<4 {
                    let x = k.0 + dx[i]
                    let y = k.1 + dy[i]
                    
                    guard x>=0 && x<size[0] && y>=0 && y<size[1] else { continue }
                    if graph[x][y] == 0 {
                        count += 1
                    } else if newVisited[x][y] == false {
                        willVisit.append((x,y))
                    }
                }
                newGraph[k.0][k.1] = max(newGraph[k.0][k.1]-count, 0)
            }
        }
        
        return (newGraph, newVisited)
    }
}