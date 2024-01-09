let n = Int(readLine()!)!
var list = [(Int, String)]()

for _ in 0..<n {
    let line = readLine()!.split(separator: " ")
    list.append((Int(line[0])!, String(line[1])))
}

list.sort { $0.0 < $1.0 }
list.forEach { print("\($0.0) \($0.1)") }