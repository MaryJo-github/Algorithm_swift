let n = Int(readLine()!)!
var serials = [String]()

for _ in 0..<n {
    let serial = readLine()!
    serials.append(serial)
}


for _ in 0..<n-1 {
    for j in 0..<n-1 {
        if serials[j].count > serials[j+1].count {
            serials.swapAt(j, j+1)
        } else if serials[j].count == serials[j+1].count {
            let left = serials[j].compactMap { Int(String($0)) }.reduce(0, +)
            let right = serials[j+1].compactMap { Int(String($0)) }.reduce(0, +)
            if left > right {
                serials.swapAt(j, j+1)
            } else if left == right {
                if serials[j] > serials[j+1] {
                    serials.swapAt(j, j+1)
                }
            }
        }
    }
}

serials.forEach { print($0) }