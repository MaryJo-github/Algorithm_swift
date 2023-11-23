let input = readLine()!.split(separator: " ").compactMap { Int($0)! }
var target = readLine()!.split(separator: " ").compactMap { Int($0)! }
var array = Array(repeating: 0, count: input[0])
(0..<input[0]).forEach { array[$0] = $0 + 1 }
var result = 0

while target.isEmpty == false {
    if array.first! == target.first! {
        array.removeFirst()
        target.removeFirst()
        continue
    }

    let index = array.firstIndex(of: target.first!)!

    if index < array.count - index {
        array.append(array.removeFirst())
    } else {
        array.insert(array.removeLast(), at: 0)
    }

    result += 1
}

print(result)