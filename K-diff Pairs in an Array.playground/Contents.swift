import UIKit

class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        if k == 0 {
            let sorted = nums.sorted {$0 < $1}
            var i = 0
            var num = Int.max
            while i < sorted.count-1 {
                if num != sorted[i] && sorted[i+1] == sorted[i] {
                    num = sorted[i]
                    count += 1
                }
                i += 1
            }
        } else {
            
            let sorted = Set(nums).sorted {$0 < $1}
            for i in 0..<sorted.count {
                var j = i+1
                while j < sorted.count {
                    let diff = sorted[j] - sorted[i]
                    if diff == k {count+=1}
                    else if diff > k {break}
                    j+=1
                }
            }
        }
        
        
        return count
    }
}

Solution().findPairs([3, 1, 4, 1, 5], 2)

Solution().findPairs([1, 1, 1, 2], 0)
