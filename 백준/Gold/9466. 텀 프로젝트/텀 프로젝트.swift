let t = Int(readLine()!)!

for _ in 0..<t {
    calculate()
}

func calculate() {
    let n = Int(readLine()!)!
    let array = readLine()!.split(separator: " ").compactMap { Int($0)!-1 }
    var visit = Array(repeating: false, count: n)
    var result = 0

    for i in 0..<n {
        if visit[i] == false {
            dfs(start: i)
        }
    }

    print(result)

    func dfs(start: Int) {
        var willVisit = [start]
        var pointer = 0
        var k = 0

        while willVisit.count > pointer {
            k = willVisit.last!
            pointer += 1

            if visit[k] == false {
                visit[k] = true

                if visit[array[k]] == false {
                    willVisit.append(array[k])
                }
            }
        }

        for i in 0..<willVisit.count {
            if willVisit[i] == array[k] {
                return
            } else {
                result += 1
            }
        }
    }
}