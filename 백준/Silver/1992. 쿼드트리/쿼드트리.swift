let n = Int(readLine()!)!
var graph = [[Character]]()

for _ in 0..<n {
    let line = Array(readLine()!)
    graph.append(line)
}

recursive(a: n, x: 0, y: 0)

func recursive(a: Int, x: Int, y: Int) {
    if check(a: a, x: x, y: y) {
        print(graph[x][y], terminator: "")
        return
    }

    let unit = a/2
    let dx = [0, 0, unit, unit]
    let dy = [0, unit, 0, unit]

    print("(", terminator: "")
    for i in 0..<4 {
        recursive(a: unit, x: x+dx[i], y: y+dy[i])
    }
    print(")", terminator: "")

}

func check(a: Int, x: Int, y: Int) -> Bool {
    let start = graph[x][y]

    for i in 0..<a {
        for j in 0..<a {
            guard graph[x+i][y+j] == start else { return false }
        }
    }

    return true
}