let n = Int(readLine()!)!
var d = Dictionary<Int, Int>()

for _ in 0..<n {
    let k = Int(readLine()!)!
    if let temp = d[k] {
        d[k] = temp + 1
    } else {
        d[k] = 1
    }
}

print(d.sorted { s1, s2 in
                if s1.value == s2.value {
                    return s1.key < s2.key
                } else {
                    return s1.value > s2.value
                }
               }[0].key)