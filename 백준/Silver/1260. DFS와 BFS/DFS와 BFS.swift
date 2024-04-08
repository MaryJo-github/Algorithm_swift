let nmv = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nmv[0]
let m = nmv[1]
let v = nmv[2]
var graph = Array(repeating: [Int](), count: n)
var result = ""

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]-1].append(input[1]-1)
    graph[input[1]-1].append(input[0]-1)
}

dfs()
result += "\n"
bfs()

print(result)

func dfs() {
    var willVisit = [Int]()
    var visited = Array(repeating: false, count: n)

    willVisit.append(v-1)
    while !willVisit.isEmpty {
        let node = willVisit.popLast()!

        if !visited[node] {
            visited[node] = true
            result += "\(node+1) "

            for element in graph[node].sorted(by: >) {
                if !visited[element] {
                    willVisit.append(element)
                }
            }
        }
    }
}

func bfs() {
    var willVisit = [Int]()
    var visited = Array(repeating: false, count: n)
    var pointer = 0

    willVisit.append(v-1)
    while willVisit.count > pointer {
        let node = willVisit[pointer]
        pointer += 1

        if !visited[node] {
            visited[node] = true
            result += "\(node+1) "

            for element in graph[node].sorted(by: <) {
                if !visited[element] {
                    willVisit.append(element)
                }
            }
        }
    }
}