import UIKit

class Solution {
    func minimumTotal(_ triangle: [[Int]]) -> Int {
        
        var possibleSum = [triangle[0][0]]
      
        for layer in triangle[1...] {
            var newSum = [Int]()
            for index in 0..<possibleSum.count {
                let ori = possibleSum[index]
                if index >= 1  {
                    if ori+layer[index] < newSum[index] {
                        newSum[index] = ori+layer[index]
                    }
                } else {
                    newSum.append(ori+layer[index])
                }
                newSum.append(ori+layer[index+1])
            }
            possibleSum = newSum
        }
        return possibleSum.min() ?? 0
    }
}

Solution().minimumTotal([
     [2],
    [3,4],
   [6,5,7],
  [4,1,8,3]
])
