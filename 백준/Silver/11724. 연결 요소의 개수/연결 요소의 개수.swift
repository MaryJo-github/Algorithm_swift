let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var graph = Array(repeating: [Int](), count: n)
var visited = Array(repeating: false, count: n)
var willVisit = [Int]()
var result = 0

for _ in 0..<m {
    let uv = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[uv[0]-1].append(uv[1]-1)
    graph[uv[1]-1].append(uv[0]-1)
}

for i in 0..<n {
    guard !visited[i] else { continue }

    willVisit.append(i)
    while willVisit.isEmpty == false {
        let node = willVisit.popLast()!

        if !visited[node] {
            visited[node] = true
            for element in graph[node] {
                guard !visited[element] else { continue }
                willVisit.append(element)
            }
        }
    }
    result += 1
}

print(result)