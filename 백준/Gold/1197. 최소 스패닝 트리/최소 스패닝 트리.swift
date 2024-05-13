let ve = readLine()!.split(separator: " ").compactMap { Int($0) }
let v = ve[0], e = ve[1]
var edges = [(u: Int, v: Int, w: Int)]()

for _ in 0..<e {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    edges.append((input[0], input[1], input[2]))
}
edges.sort { $0.w > $1.w }

var parent = Array(0...v)
var mst = [(u: Int, v: Int, w: Int)]()

while mst.count < v - 1 {
    let node = edges.removeLast()
    if findParent(node.u) != findParent(node.v) {
        union(node.u, node.v)
        mst.append(node)
    }
}
print(mst.reduce(0, { $0 + $1.w }))

func findParent(_ node: Int) -> Int {
    if node != parent[node] {
        parent[node] = findParent(parent[node])
    }
    return parent[node]
}

func union(_ v: Int, _ u: Int) {
    let rankV = findParent(v)
    let rankU = findParent(u)

    if rankV > rankU {
        parent[rankU] = rankV
    } else {
        parent[rankV] = rankU
    }
}