let input = readLine()!.split(separator: " ").map { Int($0)! }
var basket = Array(repeating: 0, count: input[0])

(0..<input[0]).forEach { basket[$0] = $0 + 1 }

for _ in 0..<input[1] {
    let line = readLine()!.split(separator: " ").map { Int($0)! }
    let start = line[0]-1
    let end = line[1]-1
    let iter = (line[1]-line[0])/2

    for i in 0...iter {
        let temp = basket[end-i]
        basket[end-i] = basket[start+i]
        basket[start+i] = temp
    }
}

print(basket.map { String($0) }.joined(separator: " "))