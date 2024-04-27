import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    func dfs(start: Int, visited: inout [Bool]) {
        var willVisit = [start]
        visited[start] = true
        
        while !willVisit.isEmpty {
            let node = willVisit.removeLast()
            
            for k in 0..<n {
                guard k != node, computers[node][k] == 1, !visited[k] else { continue }
                willVisit.append(k)
                visited[k] = true
            }
        }
    }
    
    var visited = Array(repeating: false, count: n)
    var result = 0
    
    for i in 0..<n {
        if !visited[i] {
            dfs(start: i, visited: &visited)
            result += 1
        }
    }
    
    return result
}