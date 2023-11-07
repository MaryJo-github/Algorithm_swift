let n = Int(readLine()!)!
var result: [String] = []

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { String($0).sorted() }
    if input[0] == input[1] {
        result.append("Possible")
    } else {
        result.append("Impossible")
    }
}

result.forEach { print($0) }