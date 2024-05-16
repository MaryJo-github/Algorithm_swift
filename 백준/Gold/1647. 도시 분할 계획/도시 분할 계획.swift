let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
var edges = [(u: Int, v: Int, w: Int)]()

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    edges.append((input[0], input[1], input[2]))
}
edges.sort { $0.w > $1.w }

var mst = [(u: Int, v: Int, w: Int)]()
var parent = Array(0...n)

while mst.count < n - 2 {
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