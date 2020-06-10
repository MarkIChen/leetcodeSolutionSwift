import UIKit

class Solution {
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        var pointerA = 0
        var pointerB = 0
        var ans = [Int]()
        
        while pointerA < m && pointerB < n {
            if nums1[pointerA] <= nums2[pointerB] {
                ans.append(nums1[pointerA])
                pointerA += 1
            } else {
                ans.append(nums2[pointerB])
                pointerB+=1
            }
        }
        
        while pointerA < m {
            ans.append(nums1[pointerA])
            pointerA+=1
        }
        while pointerB < n {
            ans.append(nums2[pointerB])
            pointerB+=1
        }
        
        nums1 = ans
    }
}
var num1 = [1,2,3,0,0,0]
Solution().merge(&num1, 3, [2,5,6], 3)
