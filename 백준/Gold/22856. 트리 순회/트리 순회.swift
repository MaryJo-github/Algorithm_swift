let n = Int(readLine()!)!
var trees = Array(repeating: (parent: -1, lc: -1, rc: -1), count: n+1)
var visited = Array(repeating: false, count: n+1)
var totalCount = 0

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    trees[input[0]].lc = input[1]
    trees[input[0]].rc = input[2]
    if input[1] != -1 { trees[input[1]].parent = input[0] }
    if input[2] != -1 { trees[input[2]].parent = input[0] }
}

let lastNode = findLastNode(start: 1)
유사중위순회(current: 1)
print(totalCount)

func findLastNode(start: Int) -> Int {
    var node = start
    while trees[node].rc != -1 {
        node = trees[node].rc
    }
    return node
}

func 유사중위순회(current: Int) {
    visited[current] = true

    let leftChild = trees[current].lc
    let rightChild = trees[current].rc
    let parent = trees[current].parent

    if leftChild != -1, !visited[leftChild] {
        totalCount += 1
        유사중위순회(current: leftChild)
    } else if rightChild != -1, !visited[rightChild] {
        totalCount += 1
        유사중위순회(current: rightChild)
    } else if current == lastNode {
        return
    } else if parent != -1 {
        totalCount += 1
        유사중위순회(current: parent)
    }
}