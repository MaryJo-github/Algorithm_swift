let n = Int(readLine()!)!
var d = Dictionary<Int, Int>()

for _ in 0..<n {
    d[Int(readLine()!)!, default: 0] += 1
}

print(d.max(by: { s1, s2 in
                 if s1.value == s2.value {
                     return s1.key > s2.key
                 } else {
                     return s1.value < s2.value
                 }
                })!.key)