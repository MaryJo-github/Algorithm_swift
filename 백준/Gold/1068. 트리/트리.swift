let n = Int(readLine()!)!
let parentInfo = readLine()!.split(separator: " ").compactMap { Int($0) }
let remove = Int(readLine()!)
var trees = Array(repeating: [Int](), count: n)
var root = -1
var count = 0

for (index, parent) in parentInfo.enumerated() {
    if parent == -1 {
        root = index
    } else if index != remove {
        trees[parent].append(index)
    }
}

순회(current: root)
print(remove == root ? 0 : count)

func 순회(current: Int) {
    if trees[current].isEmpty {
        count += 1
        return
    }

    for branch in trees[current] {
        순회(current: branch)
    }
}