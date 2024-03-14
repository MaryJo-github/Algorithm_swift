func solution() {
    let n = Int(readLine()!)!
    var arr = Array(repeating: true, count: n+1)
    var primes = [Int]()

    if n == 1 {
        print("0")
        return
    }

    arr[1] = false

    for i in 2...n {
        if arr[i] == true {
            primes.append(i)

            for j in stride(from: i*i, through: n, by: i) {
                arr[j] = false
            }
        }
    }

    let m = primes.count
    var end = 0
    var total = primes[0]
    var result = 0

    for start in 0..<m {
        while end < m && total <= n {
            if total == n {
                result += 1
                break
            }
            end += 1
            if end != m {
                total += primes[end]
            }
        }
        if end == m { break }
        total -= primes[start]
    }

    print(result)
}

solution()