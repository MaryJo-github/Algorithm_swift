var n = Int(readLine()!)!
var result = ""

while n != 1 {
    for i in 2...n {
        if n % i == 0 {
            result += "\(i)\n"
            n /= i
            break
        }
    }
}

print(result)