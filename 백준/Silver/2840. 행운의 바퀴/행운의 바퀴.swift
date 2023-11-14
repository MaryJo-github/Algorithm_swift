let input = readLine()!.split(separator: " ").compactMap { Int(String($0))! }
var array = Array(repeating: "?", count: input[0])
var start = 0
var resultBool = true

for _ in 0..<input[1] {
    let line = readLine()!.split(separator: " ")
    var index = start - (Int(line[0])! % input[0])
    if index < 0 {
        if index != 0 {
            index += input[0]
        }
    }
    if array[index] == "?" {
        array[index] = String(line[1])
    } else {
        if array[index] != line[1] {
            resultBool = false
            break
        }
    }
    start = index
}

if resultBool {
    var result = ""

    for i in start..<start+array.count {
        let element = array[i%array.count]
        result += element
    }

    let trueResult = result.filter { $0 != "?" }
    if trueResult.count != Set(trueResult).count {
        print("!")
    } else {
        print(result)
    }
} else {
    print("!")
}