let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = numbers[0]
let k = numbers[1]
var result = 1

if n != k {
    for i in k+1...n {
        result *= i
    }

    for i in 1...n-k {
        result /= i
    }
}

print(result)