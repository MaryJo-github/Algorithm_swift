let x = Int(readLine()!)!
var willVisit = [(x, 0)]
var pointer = 0
var visited = Array(repeating: false, count: 1000001)

while willVisit.isEmpty == false {
    let k = willVisit[pointer]
    pointer += 1

    if k.0 == 1 {
        print(k.1)
        break
    }

    if visited[k.0] == false {
        visited[k.0] = true
        if k.0 % 3 == 0 {
            willVisit.append((k.0/3, k.1+1))
        }
        if k.0 % 2 == 0 {
            willVisit.append((k.0/2, k.1+1))
        }
        willVisit.append((k.0-1, k.1+1))
    }
}