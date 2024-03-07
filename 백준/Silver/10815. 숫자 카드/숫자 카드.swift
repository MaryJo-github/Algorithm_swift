_ = Int(readLine()!)!
var cards = Set(readLine()!.split(separator: " "))
_ = Int(readLine()!)!
var array = readLine()!.split(separator: " ")
var result = ""

array.forEach {
    result += cards.contains($0) ? "1" : "0"
    result += " "
}

print(result)