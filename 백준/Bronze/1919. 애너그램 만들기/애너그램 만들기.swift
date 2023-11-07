let first = readLine()!
let second = readLine()!
var array1 = Array(repeating: 0, count: 26)
var array2 = Array(repeating: 0, count: 26)
var result = first.count + second.count

for ch in first {
    array1[Int(ch.asciiValue!)-97] += 1
}

for ch in second {
    array2[Int(ch.asciiValue!)-97] += 1
}

for i in 0..<26 {
    if array1[i] == 0 || array2[i] == 0 {
        continue
    }
    
    let cnt = min(array1[i], array2[i])
    result -= cnt * 2
}

print(result)