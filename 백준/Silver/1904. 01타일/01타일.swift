let n = Int(readLine()!)!
var array = [0, 1, 2]

if n > 2 {
    for i in 3...n {
        array.append((array[i-2] + array[i-1]) % 15746)
    }
}

print(array[n])