
var dpForward = [Int](repeating: 1, count: 4)



class Solution {
    
    func longestMountain(_ A: [Int]) -> Int {
        guard A.count > 1 else {return 0}
        var longestLength = 0
        var upwardDetecting = true
        
        var upwardCouting = 0
        var downwardCounting = 0
        
        func initCounter() {
            upwardDetecting = true
            upwardCouting = 0
            downwardCounting = 0
        }
        
        for index in 0..<A.count-1 {
            if A[index] < A[index+1] {
                if !upwardDetecting { initCounter()}
                upwardCouting += 1
            }
            else if A[index] > A[index+1] {
                if upwardCouting > 0 && upwardDetecting {upwardDetecting = false}
                if !upwardDetecting {
                    downwardCounting += 1
                    let temp = upwardCouting + downwardCounting + 1
                    if temp > longestLength {
                        longestLength = temp
                    }
                    
                }
            } else {
                initCounter()
            }
            
        }
        
        return longestLength
    }
}

Solution().longestMountain([2, 1, 4, 7, 3, 2, 5])

Solution().longestMountain([0,1,2,3,4,5,4,3,2,1,0])

Solution().longestMountain([875,884,239,731,723,685])
