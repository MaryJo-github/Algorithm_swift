import Foundation

let numbers = readLine()!.split(separator: " ").compactMap { Int($0) }

for i in numbers[0]...numbers[1] {
    if isPrime(i) {
        print(i)
    }
}

func isPrime(_ n: Int) -> Bool {
    guard n != 1 else { return false }
    guard [2, 3].contains(n) == false else { return true }

    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 {
            return false
        }
    }
    return true
}