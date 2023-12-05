let n = Int(readLine()!)!
var graphRGB = [[Int]]()
var graphRB = [[Int]]()

for _ in 0..<n {
    var tempRGB = [Int]()
    var tempRB = [Int]()

    for ch in readLine()! {
        switch ch {
            case "R":
            tempRGB.append(0)
            tempRB.append(0)
            case "G":
            tempRGB.append(1)
            tempRB.append(0)
            default:
            tempRGB.append(2)
            tempRB.append(1)
        }
    }

    graphRGB.append(tempRGB)
    graphRB.append(tempRB)
}

print(calculateRegion(graph: graphRGB))
print(calculateRegion(graph: graphRB))

func calculateRegion(graph: [[Int]]) -> Int {
    var graph = graph
    var result = 0

    for i in 0..<n {
        for j in 0..<n {
            if graph[i][j] != -1 {
                result += 1
                dfs(start: (i, j))
            }
        }
    }

    func dfs(start: (Int, Int)) {
        let dx = [0, 0, 1, -1]
        let dy = [1, -1, 0, 0]
        var willVisit = [start]

        while willVisit.isEmpty == false {
            let k = willVisit.removeLast()

            if graph[k.0][k.1] != -1 {
                let color = graph[k.0][k.1]
                graph[k.0][k.1] = -1

                for i in 0..<4 {
                    let x = k.0 + dx[i]
                    let y = k.1 + dy[i]

                    guard x >= 0 && x < n && y >= 0 && y < n else { continue }
                    if graph[x][y] == color {
                        willVisit.append((x,y))
                    }
                }
            }
        }
    }

    return result
}