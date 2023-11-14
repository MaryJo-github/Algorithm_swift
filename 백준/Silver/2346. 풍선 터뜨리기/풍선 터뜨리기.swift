let n = Int(readLine()!)!
var input = readLine()!.split(separator: " ").compactMap { Int(String($0)) }
var array = Array(repeating: 0, count: n)
(0..<n).forEach { array[$0] = $0 + 1 }
var index = 0
var result = [Int]()

for _ in 0..<n {
    result.append(array.remove(at: index))
    let change = input.remove(at: index)

    guard array.count > 0 else { break }

    index = (index + change) % array.count

    if change > 0 {
        index -= 1
    }

    if index < 0 {
        index += array.count
    }
}

print(result.map { String($0) }.joined(separator: " "))