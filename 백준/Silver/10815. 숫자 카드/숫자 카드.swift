_ = Int(readLine()!)!
let cards = Set(readLine()!.split(separator: " ").compactMap { Int($0) })
_ = Int(readLine()!)!
let array = readLine()!.split(separator: " ").compactMap { Int($0) }
var result = ""

array.forEach {
    result += cards.contains($0) ? "1" : "0"
    result += " "
}

print(result)