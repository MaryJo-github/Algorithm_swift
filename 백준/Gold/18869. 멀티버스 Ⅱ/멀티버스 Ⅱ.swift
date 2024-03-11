let mn = readLine()!.split(separator: " ").compactMap { Int($0) }
var universe = [[Int]]()
var result = 0

for _ in 0..<mn[0] {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    var array = [(Int, Int)]()
    for i in 0..<line.count {
        array.append((line[i], i))
    }
    array.sort { $0.0 < $1.0 }
    for i in 1..<line.count {
        if array[i-1].0 == array[i].0 {
            array[i].1 = array[i-1].1
        }
    }
    universe.append(array.map { $1 })
}

for i in 0..<universe.count-1 {
    for j in i+1..<universe.count {
        if universe[i] == universe[j] {
            result += 1
        }
    }
}

print(result)