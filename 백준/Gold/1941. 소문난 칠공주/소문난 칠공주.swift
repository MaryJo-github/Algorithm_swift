var array = [[Character]]()
var allCombination = [[(Int, Int)]]()
var beforeIndex = 0
var result = 0

for _ in 0..<5 {
    array.append(Array(readLine()!))
}

findAllCombination(a: 0, choosed: [(Int, Int)](), countS: 4)
for combination in allCombination {
    if isConnected(array: combination) { result += 1 }
}
print(result)

func findAllCombination(a: Int, choosed: [(Int, Int)], countS: Int) {
    if a == 7 {
        if countS <= 0 {
            allCombination.append(choosed)
        }
        return
    }

    for i in beforeIndex..<25 {
        beforeIndex = i + 1
        let x = i / 5
        let y = i % 5
        if array[x][y] == "S" {
            findAllCombination(a: a+1, choosed: choosed + [(x,y)], countS: countS-1)
        } else {
            findAllCombination(a: a+1, choosed: choosed + [(x,y)], countS: countS)
        }
    }
}

func isConnected(array: [(Int, Int)]) -> Bool {
    var visited = Array(repeating: Array(repeating: false, count: 5), count: 5)
    var willVisit = [array[0]]
    var count = 0

    while willVisit.isEmpty == false {
        let location = willVisit.removeLast()

        if visited[location.0][location.1] == false {
            visited[location.0][location.1] = true
            count += 1

            for i in array {
                let diffX = i.0 - location.0
                let diffY = i.1 - location.1
                guard (diffX == 0 && (diffY == 1 || diffY == -1)) || (diffY == 0 && (diffX == 1 || diffX == -1)) else { continue }
                guard visited[i.0][i.1] == false else { continue }
                willVisit.append((i.0,i.1))
            }
        }
    }

    if count == 7 {
        return true
    } else {
        return false
    }
}