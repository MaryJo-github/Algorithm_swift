let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var trees = Array(repeating: [(dest: Int, dist: Int)](), count: n+1)

for _ in 0..<n-1 {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    trees[input[0]].append((input[1], input[2]))
    trees[input[1]].append((input[0], input[2]))
}

var result = ""
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    result += "\(findTotalDistance(start: input[0], end: input[1]))\n"
}
print(result)

func findTotalDistance(start: Int, end: Int) -> Int {
    var pointer = 0
    var willVisit = [(start, 0)]
    var visited = Array(repeating: false, count: n+1)
    visited[start] = true

    while willVisit.count > pointer {
        let node = willVisit[pointer]
        pointer += 1

        if node.0 == end { return node.1 }

        for branch in trees[node.0] where !visited[branch.dest] {
            willVisit.append((branch.dest, node.1 + branch.dist))
            visited[branch.dest] = true
        }
    }

    return -1
}