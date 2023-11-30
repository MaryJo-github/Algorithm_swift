let size = readLine()!.split(separator: " ").compactMap { Int($0) }
var graph = [[Int]]()

for _ in 0..<size[0] {
    var temp = [Int]()
    for ch in readLine()! {
        temp.append(Int(String(ch))!)
    }
    graph.append(temp)
}

let dx = [0, 0, 1, -1]
let dy = [1, -1, 0, 0]

print(dfs(start: (0, 0)))

func dfs(start: (Int, Int)) -> Int {
    var visited = Array(repeating: Array(repeating: false, count: size[1]), count: size[0])
    var willVisit = [(start.0, start.1, 1)]
    var max = 0

    while willVisit.isEmpty == false {
        let k = willVisit.removeFirst()

        if visited[k.0][k.1] == false {
            visited[k.0][k.1] = true

            for i in 0..<4 {
                let x = k.0 + dx[i]
                let y = k.1 + dy[i]
                guard x >= 0 && x < size[0] && y >= 0 && y < size[1] else { continue }
                if graph[x][y] == 1 && visited[x][y] == false {
                    willVisit.append((x, y, k.2+1))
                }
            }

            if k.0 == size[0]-1 && k.1 == size[1]-1 {
                if max < k.2 {
                    max = k.2
                }
            }
        }
    }

    return max
}