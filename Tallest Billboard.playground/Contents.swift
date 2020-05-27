import Foundation
let a = 1

class Solution {
    
    func tallestBillboard(_ rods: [Int]) -> Int {
        
        var dp = [0: 0]
        
        for newRodLength in rods {
            for (diff, oriLength) in dp {
                dp[diff+newRodLength] = max(dp[diff+newRodLength] ?? 0, oriLength)
                dp[abs(diff-newRodLength)] = max(dp[abs(diff-newRodLength)] ?? 0, oriLength + min(newRodLength,diff))
            }
        }
        print(dp)
        return dp[0] ?? 0
    }
}


Solution().tallestBillboard([1,2,3,6])
