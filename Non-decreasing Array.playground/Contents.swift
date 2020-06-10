import UIKit

class Solution {
    func isAscent(arr: [Int]) -> Bool{
        for index in 0..<(arr.count-1) {
            if arr[index+1] < arr[index] {return false}
        }
        return true
    }
    
    func checkPossibility(_ nums: [Int]) -> Bool {
      
        for index in 0..<(nums.count-1) {
            if nums[index] > nums[index+1] {
                var firstArr = nums
                var secondArr = nums
                firstArr.remove(at: index)
                secondArr.remove(at: index+1)
                
                if isAscent(arr: firstArr)
                    || isAscent(arr: secondArr) {return true}
                else {return false}
            }
        }
        
        return true
    }
}

Solution().checkPossibility([3,3,2,2])
