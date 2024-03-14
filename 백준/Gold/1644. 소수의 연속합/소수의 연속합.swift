let n = Int(readLine()!)!
var array = Array(repeating: true, count: n+1)
var primes = [Int]()
array[0] = false
array[1] = false

if n == 1 {
    print(0)
} else {
    for i in 2...n {
        if array[i] {
            primes.append(i)

            for j in stride(from: i+i, through: n, by: i) {
                array[j] = false
            }
        }
    }

    print(find())
}

func find() -> Int {
    var result = 0
    var end = 0
    var sum = primes[0]

    for start in 0..<primes.count {
        while end < primes.count && sum < n {
            end += 1
            if end != primes.count {
                sum += primes[end]
            }
        }
        if end == primes.count { break }
        if sum == n { result += 1 }
        sum -= primes[start]
    }

    return result
}