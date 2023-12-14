let k = Int(readLine()!)!
var count = 1

for _ in 0..<k {
    count *= 2
}

print(count-1)
recursive(a: 1, b: 3, n: k)

func recursive(a: Int, b: Int, n: Int) {
    if n == 1 {
        print("\(a) \(b)")
        return
    }

    recursive(a: a, b: 6-a-b, n: n-1)
    print("\(a) \(b)")
    recursive(a: 6-a-b, b: b, n: n-1)
}