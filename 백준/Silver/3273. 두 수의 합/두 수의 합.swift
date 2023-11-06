let n = Int(readLine()!)!
let arrayString = readLine()!
var inputArray = arrayString.split(separator: " ").map { Int(String($0))! }.sorted()
let x = Int(readLine()!)!
var result = 0
var start = 0
var end = n-1

while start < end {
    let sum = inputArray[start] + inputArray[end]
    
    if sum > x {
        end -= 1
    } else if sum < x {
        start += 1
    } else {
        result += 1
        start += 1
        end -= 1
    }
}

print(result)