import Foundation

func solution(_ n:Int, _ computers:[[Int]]) -> Int {
    var visited = Array(repeating: false, count: n)
    var result = 0
    
    func dfs(start: Int) {
        var willVisit = [start]
        visited[start] = true
        
        while !willVisit.isEmpty {
            let node = willVisit.removeLast()
            
            for k in 0..<n {
                guard computers[node][k] == 1, !visited[k] else { continue }
                willVisit.append(k)
                visited[k] = true
            }
        }
    }
    
    for i in 0..<n {
        if !visited[i] {
            dfs(start: i)
            result += 1
        }
    }
    
    return result
}