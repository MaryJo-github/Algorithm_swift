let n = Int(readLine()!)!
var graph = [[Int]]()
var result = Array(repeating: 0, count: 2)

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph.append(line)
}

recursive(a: n, x: 0, y: 0)
result.forEach { print($0) }

func recursive(a: Int, x: Int, y: Int) {
    let first = graph[x][y]
    var isEqual = true

    for i in 0..<a {
        for j in 0..<a {
            guard first == graph[x+i][y+j] else {
                isEqual.toggle()
                break
            }
        }
        if isEqual == false { break }
    }

    if isEqual {
        result[first] += 1
    } else {
        let unit = a/2
        let dx = [0, unit, 0, unit]
        let dy = [0, 0, unit, unit]

        for i in 0..<4 {
            recursive(a: a/2, x: x+dx[i], y: y+dy[i])
        }
    }
}