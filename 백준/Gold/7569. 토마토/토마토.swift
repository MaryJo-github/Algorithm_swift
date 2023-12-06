let size = readLine()!.split(separator: " ").compactMap { Int($0) }
var graph = [[[Int]]]()
var visited = Array(repeating: Array(repeating: Array(repeating: false, count: size[0]), count: size[1]), count: size[2])
var willVisit = [(Int, Int, Int, Int)]()
var days = 0

for _ in 0..<size[2] {
    var temp = [[Int]]()
    for _ in 0..<size[1] {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        temp.append(line)
    }
    graph.append(temp)
}

for h in 0..<size[2] {
    for n in 0..<size[1] {
        for m in 0..<size[0] {
            if graph[h][n][m] == 1 {
                willVisit.append((h,n,m,0))
            }
        }
    }
}

var pointer = 0
let dx = [1, -1, 0, 0, 0, 0]
let dy = [0, 0, 1, -1, 0, 0]
let dh = [0, 0, 0, 0, 1, -1]

while willVisit.count > pointer {
    let k = willVisit[pointer]
    pointer += 1

    if visited[k.0][k.1][k.2] == false {
        visited[k.0][k.1][k.2] = true
        graph[k.0][k.1][k.2] = 1
        if days < k.3 {
            days = k.3
        }

        for i in 0..<dx.count {
            let x = k.0 + dx[i]
            let y = k.1 + dy[i]
            let z = k.2 + dh[i]

            guard x >= 0 && x < size[2] && y >= 0 && y < size[1] && z >= 0 && z < size[0] else { continue }
            if graph[x][y][z] == 0 && visited[x][y][z] == false {
                willVisit.append((x,y,z,k.3+1))
            }
        }
    }
}

let result = graph.flatMap { $0 }.flatMap { $0 }.reduce(1, { $0 * $1 })

if result == 0 {
    print(-1)
} else {
    print(days)
}