import Foundation

func solution(_ begin:String, _ target:String, _ words:[String]) -> Int {
    var visited = Array(repeating: false, count: words.count)
    var pointer = 0
    var willVisit = [(str: begin, depth: 0)]   

    while willVisit.count > pointer {
        let node = willVisit[pointer]
        pointer += 1
        if node.str == target {
            return node.depth
        }
        
        for (index, word) in words.enumerated() {
            guard !visited[index], checkConvert(node.str, word) else { continue }
            willVisit.append((word, node.depth + 1))
            visited[index] = true
        }
    }

    return 0
}

func checkConvert(_ s1: String, _ s2: String) -> Bool {
    let leftArray: [Character] = Array(s1)
    let rightArray: [Character] = Array(s2)
    var count = 0
    
    for i in 0..<s1.count {
        if leftArray[i] != rightArray[i] {
            count += 1
        }
    }
    
    return count == 1 ? true : false
}