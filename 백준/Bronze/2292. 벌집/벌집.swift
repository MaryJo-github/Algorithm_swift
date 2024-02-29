var n = Int(readLine()!)!
var temp = 6
var result = 1

n -= 1
while n > 0 {
    n -= temp
    temp += 6
    result += 1
}

print(result)