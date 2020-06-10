import UIKit

class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        var count = 0
        for i in 0..<nums.count {
            for j in (i+1)..<nums.count {
                if nums[i] - nums[j] == k {
                    print(i, j)
                    count += 1
                }
            }
        }
        
        return count
    }
}

Solution().findPairs([3, 1, 4, 1, 5], 2)

Solution().findPairs([1, 1, 1, 2], 0)

