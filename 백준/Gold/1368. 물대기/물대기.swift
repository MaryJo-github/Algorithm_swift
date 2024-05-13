let n = Int(readLine()!)!
var edges = [(u: Int, v: Int, w: Int)]()

for i in 0..<n {
    let weight = Int(readLine()!)!
    edges.append((i, n, weight))
}

for i in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for (index, value) in input.enumerated() {
        guard i < index else { continue }
        edges.append((i, index, value))
    }
}

edges.sort { $0.w > $1.w }

var mst = [(u: Int, v: Int, w: Int)]()
var parent = Array(0...n)

while mst.count < n {
    let edge = edges.removeLast()
    if findAncestor(edge.u) != findAncestor(edge.v) {
        union(edge.u, edge.v)
        mst.append(edge)
    }
}
print(mst.reduce(0, { $0 + $1.w }))

func findAncestor(_ node: Int) -> Int {
    if node != parent[node] {
        parent[node] = findAncestor(parent[node])
    }
    return parent[node]
}

func union(_ u: Int, _ v: Int) {
    let au = findAncestor(u)
    let av = findAncestor(v)

    if u < v {
        parent[av] = au
    } else {
        parent[au] = av
    }
}