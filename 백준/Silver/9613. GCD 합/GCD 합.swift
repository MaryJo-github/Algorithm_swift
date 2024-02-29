let t = Int(readLine()!)!
var result = ""

for _ in 0..<t {
    let input = readLine()!.split(separator: " ").compactMap { Int($0) }
    result += "\(calculateGCDSum(array: input))\n"
}

print(result)

func calculateGCDSum(array: [Int]) -> Int {
    var sum = 0

    if array.count == 2 { return array[1] }
    for i in 1...array.count-2 {
        for j in i+1...array.count-1 {
            sum += GCD(x: array[i], y: array[j])
        }
    }

    return sum
}

func GCD(x: Int, y: Int) -> Int {
    if y == 0 { return x }
    return GCD(x: y, y: x % y)
}