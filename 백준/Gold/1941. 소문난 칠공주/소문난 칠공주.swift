var array = [[Character]]()
var allCombination = [[(Int, Int, Int)]]()
var beforeIndex = 0
var result = 0

for _ in 0..<5 {
    array.append(Array(readLine()!))
}

findAllCombination(a: 0, choosed: [(Int, Int, Int)](), countS: 4)
print(result)

func findAllCombination(a: Int, choosed: [(Int, Int, Int)], countS: Int) {
    if a == 7 {
        if countS <= 0, isConnected(array: choosed) {
            result += 1
        }
        return
    }

    for i in beforeIndex..<25 {
        beforeIndex = i + 1
        let x = i / 5
        let y = i % 5
        if array[x][y] == "S" {
            findAllCombination(a: a+1, choosed: choosed + [(a,x,y)], countS: countS-1)
        } else {
            findAllCombination(a: a+1, choosed: choosed + [(a,x,y)], countS: countS)
        }
    }
}

func isConnected(array: [(Int, Int, Int)]) -> Bool {
    var visited = Array(repeating: false, count: 7)
    var willVisit = [array[0]]
    var count = 0

    while willVisit.isEmpty == false {
        let location = willVisit.removeLast()

        if visited[location.0] == false {
            visited[location.0] = true
            count += 1

            for i in array {
                let diffX = i.1 - location.1
                let diffY = i.2 - location.2
                guard (diffX == 0 && (diffY == 1 || diffY == -1)) || (diffY == 0 && (diffX == 1 || diffX == -1)) else { continue }
                guard visited[i.0] == false else { continue }
                willVisit.append((i.0,i.1,i.2))
            }
        }
    }

    if count == 7 {
        return true
    } else {
        return false
    }
}