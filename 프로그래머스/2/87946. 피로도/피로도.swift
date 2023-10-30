import Foundation

func solution(_ k: Int, _ dungeons: [[Int]]) -> Int {
    var maxCnt = 0
    
    for i in 0..<dungeons.count {
        var newArray = dungeons[0..<i]
        newArray.append(contentsOf: dungeons[i+1..<dungeons.count])
        maxCnt = calculation(k, dungeons[i], Array(newArray), 0, maxCnt)
    }
    
    return maxCnt
}

func calculation(_ k: Int, _ current: [Int], _ array: [[Int]], _ cnt: Int, _ maxCnt: Int) -> Int {
    var cnt_ = cnt
    var maxCnt_ = maxCnt
    
    if k >= current[0] {
        var k_ = k - current[1]
        cnt_ = cnt_ + 1
        for i in 0..<array.count {
            var newArray = array[0..<i]
            newArray.append(contentsOf: array[i+1..<array.count])
            maxCnt_ = calculation(k_, array[i], Array(newArray), cnt_, maxCnt_)
        }
    }
    
    if maxCnt_ < cnt_ {
        maxCnt_ = cnt_
    }
        
    return maxCnt_
}