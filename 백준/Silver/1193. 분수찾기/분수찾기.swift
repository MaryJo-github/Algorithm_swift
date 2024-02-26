let x = Int(readLine()!)!
var array = [1]
var result = ""

while array.last! < x {
    array.append(array.last! + array.count + 1)
}

if x == 1 { print("1/1") }
else {
    let index = x-array[array.count-2]-1
    if array.count % 2 == 1 {
        // 내림, 오름
        result += "\(Array(stride(from: array.count, through: 1, by: -1))[index])/"
        result += "\(Array(stride(from: 1, through: array.count, by: 1))[index])"
    } else {
        result += "\(Array(stride(from: 1, through: array.count, by: 1))[index])/"
        result += "\(Array(stride(from: array.count, through: 1, by: -1))[index])"
    }

    print(result)
}