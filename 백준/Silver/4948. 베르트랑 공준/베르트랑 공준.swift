import Foundation

var array = Array(repeating: true, count: 123456*2+1)
var result = ""

array[1] = false

for i in 2..<Int(sqrt(Double(array.count))+1) {
    if array[i] {
        for j in stride(from: i+i, through: array.count-1, by: i) {
            array[j] = false
        }
    }
}

while let input = Int(readLine()!), input != 0 {
    result += "\(findNumberOfPrimes(input))\n"
}

print(result)

func findNumberOfPrimes(_ n: Int) -> Int {
    var count = 0

    for i in n+1...n*2 {
        if array[i] == true {
            count += 1
        }
    }

    return count
}