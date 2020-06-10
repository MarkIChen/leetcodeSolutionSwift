import UIKit

class Solution {
    func new21Game(_ N: Int, _ K: Int, _ W: Int) -> Double {
        if K==0 || N >= K-1+W {return 1.0}
        
        var dp = Array(repeating: 1.0, count: N+1)
        var WSum = 1.0, res = 0.0
        for i in 1...N {
            dp[i] = WSum / Double(W)
            if i<K {WSum += dp[i]} else {res+=dp[i]}
            if i >= W {WSum -= dp[i-W]}
        }
        
        return res
    }
}


Solution().new21Game(10, 1, 10)
