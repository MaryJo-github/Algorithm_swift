_ = readLine()!
let a = readLine()!.split(separator: " ").compactMap { Int($0) }
let b = Set(readLine()!.split(separator: " ").compactMap { Int($0) })
var result = [Int]()

for element in a {
    if b.contains(element) { continue }
    result.append(element)
}
result.sort()

print(result.count)
if result.count != 0 {
    print(result.map { String($0) }.joined(separator: " "))
}