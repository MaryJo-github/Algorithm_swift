import Foundation

var n = Int(readLine()!)!
var result = ""

while n != 1 {
    let limit = n > 3 ? Int(sqrt(Double(n))) : n

    for i in 2...limit {
        if n % i == 0 {
            result += "\(i)\n"
            n /= i
            break
        }

        if i == limit {
            result += "\(n)\n"
            n /= n
        }
    }
}

print(result)