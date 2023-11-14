let input = readLine()!.split(separator: " ").map { Int(String($0))! }
var array = Array(repeating: "?", count: input[0])
var start = 0
var resultBool = true
var result = ""

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
    var trueResult = ""

    for i in start..<start+array.count {
        let element = array[i%array.count]
        result += element
        if element != "?" {
            trueResult += element
        }
    }
    if trueResult.count != Set(trueResult).count {
        print("!")
    } else {
        print(result)
    }
} else {
    print("!")
}