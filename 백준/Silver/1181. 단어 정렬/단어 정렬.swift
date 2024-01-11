let n = Int(readLine()!)!
var array = Set<String>()
var tuple = [(String, Int)]()

for _ in 0..<n {
    array.insert(String(readLine()!))
}

tuple = Array(array).map { ($0, $0.count) }

print(tuple.sorted(by: { $0.1 == $1.1 ? $0.0 < $1.0 : $0.1 < $1.1 }).map { $0.0 }.joined(separator: "\n"))