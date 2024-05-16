let n = Int(readLine()!)!
var edges = [(u: Int, v: Int, w: Int)]()

for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for j in 0..<n {
        guard j > i else { continue }
        edges.append((i, j, input[j]))
    }
}
edges.sort { $0.w > $1.w }

var parent = Array(0...n)
var mst = [(u: Int, v: Int, w: Int)]()

while mst.count < n - 1 {
    let edge = edges.removeLast()
    if findAncestor(edge.u) != findAncestor(edge.v) {
        mst.append(edge)
        union(u: edge.u, v: edge.v)
    }
}
print(mst.reduce(0, { $0 + $1.w }))

func findAncestor(_ n: Int) -> Int {
    if parent[n] != n {
        parent[n] = findAncestor(parent[n])
    }
    return parent[n]
}

func union(u: Int, v: Int) {
    let au = findAncestor(u)
    let av = findAncestor(v)

    if au < av {
        parent[av] = au
    } else {
        parent[au] = av
    }
}