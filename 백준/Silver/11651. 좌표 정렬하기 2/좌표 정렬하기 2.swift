let n = Int(readLine()!)!
var locations = [(x: Int, y: Int)]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ").compactMap { Int($0) }
    locations.append((line[0], line[1]))
}

locations.sort { $0.y == $1.y ? $0.x < $1.x : $0.y < $1.y }
locations.forEach { print("\($0.x) \($0.y)") }