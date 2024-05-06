let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n + 1)
var indegrees = Array(repeating: 0, count: n + 1)
indegrees[0] = Int.max

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    for i in 1..<input[0] {
        graph[input[i]].append(input[i+1])
        indegrees[input[i+1]] += 1
    }
}

var queue = indegrees.enumerated().filter { $0.element == 0 }.map { $0.offset }
var pointer = 0
var result = [String]()

while queue.count > pointer {
    let node = queue[pointer]
    pointer += 1
    result.append(String(node))
    for branch in graph[node] {
        indegrees[branch] -= 1
        if indegrees[branch] == 0 {
            queue.append(branch)
        }
    }
}

result.count == n ? print(result.joined(separator: "\n")) : print(0)