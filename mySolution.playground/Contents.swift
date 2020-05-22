

class Solution {
    func divide(_ dividend: Int, _ divisor: Int) -> Int {
        var isNegative = false
        if (dividend<0 && divisor>0) || (dividend>0 && divisor<0) {isNegative = true}
        
        var newDivident = abs(dividend)
        let newDivisor = abs(divisor)
        var res = 0
        
        for offset in (0..<32).reversed() {
            if newDivident >> offset >= newDivisor {
                newDivident -= newDivisor << offset
                res += 1 << offset
            }
        }
        
        res = isNegative ? -res : res
        
        if res > Int32.max {
            res = Int(Int32.max)
        } else if res < Int32.min {
            res = Int(Int32.min)
        }
       
        
        return res
    }
}

Solution().divide(100, 7)


Solution().divide(-2147483648, -1)
