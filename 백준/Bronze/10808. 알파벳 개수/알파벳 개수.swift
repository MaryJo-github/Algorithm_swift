let input = readLine()!
var array = Array(repeating: 0, count: 26)

for char in input {
    array[Int(UnicodeScalar(String(char))!.value)-97] += 1
}

print(array.map{ String($0) }.joined(separator: " "))