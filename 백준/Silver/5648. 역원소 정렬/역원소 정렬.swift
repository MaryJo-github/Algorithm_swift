var line = readLine()!.split(separator: " ")
let n = Int(line.removeFirst())!
var count = line.count
var array = line

while count != n {
    line = readLine()!.split(separator: " ")
    array.append(contentsOf: line)
    count += line.count
}

array.compactMap { Int(String($0.reversed())) }.sorted().forEach { print($0) }