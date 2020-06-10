import Foundation



class Solution {
//    var dp = [0: 0]
    func numberOfSteps (_ num: Int) -> Int {
        
//        if let record = dp[num] {
//            return record
//        }
        if num == 0 {return 0}
        if num % 2 == 0 {return 1 + numberOfSteps(num/2)}
        else {return 1+numberOfSteps(num-1)}
       
    }
}


Solution().numberOfSteps(14)

