var fibo = [0, 1]
let n = Int(readLine()!)!

if n > 1 {
    for i in 2...n {
        fibo.append(fibo[i-2] + fibo[i-1])
    }
}

print(fibo[n])