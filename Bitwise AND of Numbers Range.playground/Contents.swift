import UIKit


class Solution {
    func rangeBitwiseAnd(_ m: Int, _ n: Int) -> Int {
        if m == 0 {return 0}
        if m==n {return m&n}
        if Int(log2(Double(m))) != Int(log2(Double(n))) {return 0}
        
        return Array((m+1)...n).reduce(m) {$0 & $1}
    }
}
Solution().rangeBitwiseAnd(5, 7)

Solution().rangeBitwiseAnd(1, 1)

Solution().rangeBitwiseAnd(0, 2147483647)

