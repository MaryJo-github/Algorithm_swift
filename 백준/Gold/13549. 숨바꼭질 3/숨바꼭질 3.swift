let line = readLine()!.split(separator: " ").compactMap { Int($0) }
let start = line[0]
let end = line[1]
var willVisit = [(start, 0)]
var pointer = 0
var visited = Array(repeating: false, count: 101000)
let dx = [-1, 1]

while willVisit.count > pointer {
    let k = willVisit[pointer]
    pointer += 1

    if k.0 == end {
        print(k.1)
        break
    }

    if visited[k.0] == false {
        visited[k.0] = true

        if k.0*2 < 101000 && visited[k.0*2] == false {
            willVisit.append((k.0*2, k.1))
        }

        for i in 0..<2 {
            let x = k.0+dx[i]
            guard x >= 0 && x < 101000 else { continue }
            if visited[x] == false {
                willVisit.append((x, k.1+1))
            }
        }
    }
}