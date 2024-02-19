let formula = readLine()!
var array = [String]()
var newArray = [String]()
var temp = ""
var flag = false
var result = 0

for char in formula {
    if char == "-" || char == "+" {
        array.append(temp)
        array.append(String(char))
        temp = ""
    } else {
        temp += String(char)
    }
}
array.append(temp)

for element in array {
    if element == "+" {
        newArray.removeLast()
        flag = true
    } else if flag == true  {
        let result = String(Int(temp)! + Int(element)!)
        newArray.append(result)
        temp = result
        flag = false
    } else {
        temp = element
        newArray.append(element)
    }
}

for i in 0..<newArray.count {
    if i == 0 {
        result = Int(newArray[i])!
        continue
    }

    if let number = Int(newArray[i]) {
        result -= number
    }
}

print(result)