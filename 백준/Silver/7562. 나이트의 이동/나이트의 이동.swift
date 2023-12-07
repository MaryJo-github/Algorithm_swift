let t = Int(readLine()!)!
var result = [Int]()

for _ in 0..<t {
    testCase()
}

result.forEach { print($0) }

func testCase () {
    let i = Int(readLine()!)!
    let start = readLine()!.split(separator: " ").compactMap { Int($0) }
    let end = readLine()!.split(separator: " ").compactMap { Int($0) }
    var graph = Array(repeating: Array(repeating: 0, count: i), count: i)
    var willVisit = [(start[0],start[1], 0)]
    var pointer = 0
    let dx = [1, 1, -1, -1, 2, 2, -2, -2]
    let dy = [2, -2, 2, -2, 1, -1, 1, -1]

    graph[start[0]][start[1]] = 1

    while willVisit.count > pointer {
        let k = willVisit[pointer]
        pointer += 1

        if graph[k.0][k.1] != -1 {
            graph[k.0][k.1] = -1

            if k.0 == end[0] && k.1 == end[1] {
                result.append(k.2)
                return
            }

            for j in 0..<dx.count {
                let x = k.0 + dx[j]
                let y = k.1 + dy[j]

                guard x >= 0 && x < i && y >= 0 && y < i else { continue }
                if graph[x][y] != -1 {
                    willVisit.append((x,y,k.2+1))
                }
            }
        }
    }
}