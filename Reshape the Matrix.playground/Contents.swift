import UIKit

class Solution {
    func matrixReshape(_ nums: [[Int]], _ r: Int, _ c: Int) -> [[Int]] {
        let oriRow = nums.count
        let oriCol = nums.first?.count ?? 0
        if oriCol * oriRow != r*c {return nums}
        
        var ans = Array(repeating: Array(repeating: 0, count: c), count: r)
        for row in 0..<oriRow {
            for col in 0..<oriCol {
                let num = nums[row][col]
                let index = row * oriCol + col
                
                let newRow = index / c
                let newCol = index % c
                ans[newRow][newCol] = num
            }
        }
        
        return ans
    }
}

Solution().matrixReshape([[1,2],[3,4]], 1, 4)


Solution().matrixReshape([[1],[2],[3],[4]], 2, 2)
