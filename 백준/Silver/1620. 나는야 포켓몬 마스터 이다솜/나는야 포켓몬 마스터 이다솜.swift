let nm = readLine()!.split(separator: " ").compactMap { Int($0) }
let n = nm[0]
let m = nm[1]
var pocketmons = [String: Int]()
var pocketmonsArray = [String]()
var result = ""

for i in 0..<n {
    let pocketmon = readLine()!
    pocketmons[pocketmon] = i+1
    pocketmonsArray.append(pocketmon)
}

for _ in 0..<m {
    let input = readLine()!

    if let number = Int(input) {
        result += "\(pocketmonsArray[number-1])\n"
    } else {
        result += "\(pocketmons[input]!)\n"
    }
}

print(result)