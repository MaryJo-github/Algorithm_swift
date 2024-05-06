let n = Int(readLine()!)!
var graph = [String: [String]]()
var indegrees = [String: Int]()

let names = readLine()!.split(separator: " ").compactMap { String($0) }
names.forEach { name in
               graph[name] = []
               indegrees[name] = 0
              }

let m = Int(readLine()!)!
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").compactMap { String($0) }
    graph[input[1]]!.append(input[0])
    indegrees[input[0]]! += 1
}

var ancestors = indegrees.filter { $0.value == 0 }.map { $0.key }
var queue = ancestors.map { (current: $0, parent: "") }
var pointer = 0
var trees = [String: [String]]()
names.forEach { name in
               trees[name] = []
              }

while queue.count > pointer {
    let node = queue[pointer]
    pointer += 1

    if !node.parent.isEmpty {
        trees[node.parent]!.append(node.current)
    }

    for branch in graph[node.current]! {
        indegrees[branch]! -= 1
        if indegrees[branch] == 0 {
            queue.append((branch, node.current))
        }
    }
}

var lines = [String]()
trees.forEach { tree in
               var line = "\(tree.key) \(tree.value.count) "

               if !tree.value.isEmpty {
                   line += tree.value.sorted().joined(separator: " ")
               }

               lines.append(line)
              }

print(ancestors.count)
print(ancestors.sorted().joined(separator: " "))
print(lines.sorted().joined(separator: "\n"))