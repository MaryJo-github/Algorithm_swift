let nrq = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nrq[0]
let r = nrq[1]
let q = nrq[2]
var trees = Array(repeating: [Int](), count: n)
var children = Array(repeating: [Int](), count: n)
var countSubtrees = Array(repeating: 0, count: n)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    trees[input[0] - 1].append(input[1] - 1)
    trees[input[1] - 1].append(input[0] - 1)
}

findChildren(current: r - 1, parent: -1)
countSubtreeNodes(current: r - 1)

func findChildren(current: Int, parent: Int) {
    for node in trees[current] {
        guard node != parent else { continue }
        children[current].append(node)
        findChildren(current: node, parent: current)
    }
}

var result = ""
for _ in 0..<q {
    let input = Int(readLine()!)!
    result += "\(countSubtrees[input - 1])\n"
}
print(result)

func countSubtreeNodes(current: Int) {
    countSubtrees[current] = 1
    for node in children[current] {
        countSubtreeNodes(current: node)
        countSubtrees[current] += countSubtrees[node]
    }
}