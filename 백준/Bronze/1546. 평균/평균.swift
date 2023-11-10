let n = Int(readLine()!)!
let input = readLine()!.split(separator: " ").map { Double($0)! }
let max = input.max()!
var new = Array(repeating: 0.0, count: n)

(0..<n).forEach { new[$0] = input[$0]/max*100 }

print(new.reduce(0,+)/Double(n))