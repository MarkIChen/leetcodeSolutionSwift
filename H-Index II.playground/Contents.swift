import UIKit



class Solution {
    func hIndex(_ citations: [Int]) -> Int {
        for index in 0..<citations.count {
            let restPaperAmount = citations.count - index
            if citations[index] >= restPaperAmount {return restPaperAmount}
        }
        return 0
    }
}

Solution().hIndex([0, 1, 4 ,5 ,6])



