let input = readLine()!.split(separator: " ").map { Int($0)! }

var basket = Dictionary<Int, Int>()

for n in 1...input[0] {
    basket[n] = n
}

for _ in 0..<input[1] {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let temp = basket[line[0]]
    basket[line[0]] = basket[line[1]]
    basket[line[1]] = temp
}

var temp = Array(repeating: 0, count: input[0])
basket.forEach { temp[$0.key-1] = $0.value }
print(temp.map { String($0) }.joined(separator: " "))