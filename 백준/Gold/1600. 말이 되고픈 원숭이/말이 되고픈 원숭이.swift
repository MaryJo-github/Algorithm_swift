말이되고픈원숭이()
func 말이되고픈원숭이() {
    let k = Int(readLine()!)!
    let size = readLine()!.split(separator: " ").compactMap { Int($0) }
    var graph = [[Int]]()
    
    for _ in 0..<size[1] {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph.append(line)
    }
    
    var willVisit = [(0,0,0,k)]
    var pointer = 0
    let dx = [0,0,1,-1]
    let dy = [1,-1,0,0]
    let hdx = [1,1,-1,-1,2,2,-2,-2]
    let hdy = [2,-2,2,-2,1,-1,1,-1]
    var visited = Array(repeating: Array(repeating: Array(repeating: false, count: k+1), count: size[0]), count: size[1])
    
    while willVisit.count > pointer {
        let a = willVisit[pointer]
        pointer += 1
        
        if a.0 == size[1]-1 && a.1 == size[0]-1 {
            print(a.2)
            return
        }
        
        if visited[a.0][a.1][a.3] == false {
            visited[a.0][a.1][a.3] = true
            
            for i in 0..<dx.count {
                let x = a.0 + dx[i]
                let y = a.1 + dy[i]
                
                guard x>=0 && x<size[1] && y>=0 && y<size[0] else { continue }
                if graph[x][y] == 0 && visited[x][y][a.3] == false {
                    willVisit.append((x,y,a.2+1,a.3))
                }
            }
            
            guard a.3 > 0 else { continue }
            for i in 0..<hdx.count {
                let x = a.0 + hdx[i]
                let y = a.1 + hdy[i]
                
                guard x>=0 && x<size[1] && y>=0 && y<size[0] else { continue }
                if graph[x][y] == 0 && visited[x][y][a.3-1] == false {
                    willVisit.append((x,y,a.2+1,a.3-1))
                }
            }
        }
    }
    print(-1)
}