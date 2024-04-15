let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n)
var count = 0
var array = [Int]()
var maxValue = 0
var result = ""

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[1] - 1].append(input[0] - 1)
}

for i in 0..<n {
    array.append(bfs(start: i))
    maxValue = max(maxValue, array[i])
}

for i in 0..<n {
    if array[i] == maxValue {
        result += "\(i + 1) "
    }
}
print(result)

func bfs(start: Int) -> Int {
    var visited = Array(repeating: false, count: n)
    var willVisit = [start]
    var result = 0
    var pointer = 0

    visited[start] = true

    while willVisit.count > pointer {
        let node = willVisit[pointer]
        pointer += 1

        for computer in graph[node] {
            guard !visited[computer] else { continue }

            visited[computer] = true
            result += 1
            willVisit.append(computer)
        }
    }

    return result
}