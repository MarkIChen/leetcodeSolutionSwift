import UIKit


class Solution {
    func findPairs(_ nums: [Int], _ k: Int) -> Int {
        let sorted = nums.sorted {$0 < $1}
        var collector = [Int: Set<Int>]()

        for i in 0..<sorted.count {
            var j = i+1
            while j < sorted.count {
                let diff = sorted[j] - sorted[i]
                if diff == k {
                    if collector[sorted[i]] == nil {
                       collector[sorted[i]] = Set()
                    }
                    collector[sorted[i]]?.insert(sorted[j])
                }
                else if diff > k {break}
                j+=1
            }
        }
        var count = 0
        for (_, set) in collector {count += set.count}
        
        return count
    }
}

Solution().findPairs([3, 1, 4, 1, 5], 2)

Solution().findPairs([1,3,1,5,4]
, 0)
