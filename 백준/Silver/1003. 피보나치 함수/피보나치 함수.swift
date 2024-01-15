let t = Int(readLine()!)!
var result = ""
var fibo = [(1, 0), (0, 1)]

for _ in 0..<t {
    let returnValue = fibonacci(Int(readLine()!)!)
    result += "\(returnValue.0) \(returnValue.1)\n"
}
print(result)

func fibonacci(_ n: Int) -> (Int, Int) {
    while fibo.count <= n {
        fibo.append((fibo[fibo.count-1].0+fibo[fibo.count-2].0, fibo[fibo.count-1].1+fibo[fibo.count-2].1))
    }

    return fibo[n]
}