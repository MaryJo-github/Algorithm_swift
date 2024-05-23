let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0], m = nm[1]
let maxValue = 1000*(200-1)+1
var graph = Array(repeating: Array(repeating: maxValue, count: n), count: n)

for i in 0..<n {
    graph[i][i] = 0
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    graph[input[0]-1][input[1]-1] = input[2]
}

for k in 0..<n {
    for s in 0..<n {
        for t in 0..<n {
            graph[s][t] = min(graph[s][t], graph[s][k] + graph[k][t])
        }
    }
}

_ = Int(readLine()!)!
let cities = readLine()!.split(separator: " ").compactMap { Int($0)!-1 }
var result = (cities: [Int](), value: Int.max)

for i in 0..<n {
    var max = (cities: [Int](), value: 0)
    for city in cities {
        guard city != i else { continue }
        let time = graph[city][i] + graph[i][city]
        if max.value < time {
            max = ([i], time)
        } else if max.value == time {
            max.cities.append(i)
        }
    }
    if result.value > max.value {
        result = max
    } else if result.value == max.value {
        result.cities += max.cities
    }
}

print(Set(result.cities).sorted().map { String($0+1) }.joined(separator: " "))