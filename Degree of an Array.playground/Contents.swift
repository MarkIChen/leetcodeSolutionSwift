import UIKit

class Solution {
    func findShortestSubArray(_ nums: [Int]) -> Int {
        var posiDic = [Int: [Int]]()
        for index in 0..<nums.count {
            if posiDic[nums[index]] == nil {
                posiDic[nums[index]] = []
            }
            posiDic[nums[index]]!.append(index)
        }
        let sortedDic = posiDic.sorted {$0.value.count < $1.value.count}
        let max = sortedDic.last?.value.count ?? 0
        let keys = posiDic.filter {$0.value.count == max}.keys
        
        var minDistance = Int.max
        for key in keys {
            let diff = posiDic[key]!.last! - posiDic[key]!.first! + 1
            if diff < minDistance {minDistance = diff}
        }
        return minDistance
    }
}

Solution().findShortestSubArray([1,2,2,3,1,4,2])

