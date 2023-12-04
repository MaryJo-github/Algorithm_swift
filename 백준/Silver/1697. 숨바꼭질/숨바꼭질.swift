let line = readLine()!.split(separator: " ").compactMap { Int($0) }
var graph = Array(repeating: false, count: 100001)
var willVisit = [(line[0], 0)]
var pointer = 0

while willVisit.count > pointer {
    let k = willVisit[pointer]
    pointer += 1

    if graph[k.0] == false {
        graph[k.0] = true

        if k.0 == line[1] {
            print(k.1)
            break
        }

        let x = [k.0-1, k.0+1, k.0*2]
        for i in x {
            guard i >= 0 && i <= 100000 else { continue }
            if graph[i] == false {
                willVisit.append((i, k.1+1))
            }
        }
    }
}