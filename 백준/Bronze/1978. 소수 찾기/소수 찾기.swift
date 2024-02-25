import Foundation

let n = Int(readLine()!)!
let array = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = 0

for a in array {
    if isPrime(a) {
        result += 1
    }
}

print(result)

func isPrime(_ n: Int) -> Bool {
    guard n != 1 else { return false }
    guard [2,3].contains(n) == false else { return true }

    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 {
            return false
        }
    }
    return true
}