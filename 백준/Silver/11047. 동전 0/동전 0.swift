let line = readLine()!.split(separator: " ").compactMap { Int($0) }
var coins = [Int]()
var target = line[1]
var result = 0

for _ in 0..<line[0] {
    coins.append(Int(readLine()!)!)
}

for i in stride(from: line[0]-1, through: 0, by: -1) {
    if target >= coins[i] {
        result += target / coins[i]
        target = target % coins[i]
    }
}

print(result)