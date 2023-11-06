let A = readLine()
let B = readLine()
let C = readLine()
let ABC = String(Int(A!)! * Int(B!)! * Int(C!)!)
var array = Array(repeating: 0, count: 10)

for number in ABC {
    array[Int(String(number))!] += 1
}

array.forEach({
    print($0)
})