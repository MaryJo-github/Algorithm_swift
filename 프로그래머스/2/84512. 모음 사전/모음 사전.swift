import Foundation

func solution(_ word:String) -> Int {
    var result = 0
    let temp = [781, 156, 31, 6, 1]
    
    for i in 0 ..< word.count {
        let index = ["A","E","I","O","U"].firstIndex(of: Array(word)[i])
        result += (1 + temp[i] * index!)
    }
    
    return result
}