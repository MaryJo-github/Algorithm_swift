let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n)

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0] - 1].append(input[1] - 1)
    graph[input[1] - 1].append(input[0] - 1)
}

let result = bfs(start: 0)
print("\(result.place) \(result.distance) \(result.number)")

func bfs(start: Int) -> (place: Int, distance: Int, number: Int) {
    var visited = Array(repeating: false, count: n)
    var willVisit = [(place: start, distance: 0)]
    var history = [(place: Int, distance: Int)]()
    var pointer = 0

    visited[start] = true

    while willVisit.count > pointer {
        let node = willVisit[pointer]
        pointer += 1

        for place in graph[node.place] {
            guard !visited[place] else { continue }

            history.append((place, node.distance + 1))
            visited[place] = true
            willVisit.append((place, node.distance + 1))
        }
    }

    history.sort { $0.distance == $1.distance ? $0.place < $1.place : $0.distance > $1.distance }
    let maxDistance = history.first!.distance
    let number = history.filter { $0.distance ==  maxDistance }.count

    return (history.first!.place + 1, maxDistance, number)
}