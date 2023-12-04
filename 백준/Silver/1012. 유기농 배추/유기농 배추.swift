let t = Int(readLine()!)!
var result = [Int]()
var size = [Int]()
var graph = [[Int]]()

for _ in 0..<t {
    size = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph = Array(repeating: Array(repeating: 0, count: size[1]), count: size[0])
    calculate()
}

result.forEach { print($0) }

func calculate() {
    var ones = [(Int, Int)]()
    var count = 0

    for _ in 0..<size[2] {
        let line = readLine()!.split(separator: " ").compactMap { Int($0) }
        graph[line[0]][line[1]] = 1
        ones.append((line[0], line[1]))
    }

    for i in ones {
        if graph[i.0][i.1] == 1 {
            count += 1
            dfs((i.0, i.1))
        }
    }

    result.append(count)
}

func dfs(_ start: (Int, Int)) {
    var willVisit = [start]
    let dx = [0, 0, 1, -1]
    let dy = [1, -1, 0, 0]

    while willVisit.isEmpty == false {
        let k = willVisit.removeLast()

        if graph[k.0][k.1] == 1 {
            graph[k.0][k.1] = 0

            for i in 0..<4 {
                let x = k.0 + dx[i]
                let y = k.1 + dy[i]

                guard x >= 0 && x < graph.count && y >= 0 && y < graph[0].count else { continue }

                if graph[x][y] == 1 {
                    willVisit.append((x, y))
                }
            }
        }
    }
}