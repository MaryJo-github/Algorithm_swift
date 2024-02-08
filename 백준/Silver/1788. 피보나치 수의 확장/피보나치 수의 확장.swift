let n = Int(readLine()!)!
var fibo = [0, 1]

if abs(n) > 1 {
    for i in 2...abs(n) {
        fibo.append((fibo[i-2] + fibo[i-1]) % 1000000000)
    }
}

if n == 0 {
    print("0\n0")
} else if n >= -1 {
    print("1\n\(fibo[abs(n)])")
} else {
    print("\(n % 2 == 0 ? -1 : 1)\n\(fibo[abs(n)])")
}