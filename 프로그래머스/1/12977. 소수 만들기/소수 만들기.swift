import Foundation

func solution(_ nums: [Int]) -> Int {
    var cnt = 0
    
    for first in 0...nums.count-3 {
        for second in first+1...nums.count-2 {
            for third in second+1...nums.count-1 {
                if isPrime(nums[first] + nums[second] + nums[third]) {
                    cnt += 1
                }
            }
        }
    }
    
    return cnt
}

func isPrime(_ n: Int) -> Bool {
    for i in 2...Int(sqrt(Double(n))) {
        if n % i == 0 { return false }
    }
    return true
}