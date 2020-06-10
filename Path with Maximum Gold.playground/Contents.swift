import UIKit

class Solution {
    func getDirArr(curr: (Int, Int), m: Int, n: Int) -> [(Int, Int)] {
        let up = (curr.0, curr.1-1)
        let left = (curr.0-1, curr.1)
        let right = (curr.0+1, curr.1)
        let down = (curr.0, curr.1+1)
        let candidate = [up, left, right, down]

        return candidate.filter {
            $0 >= 0 && $1 >= 0 && $0 < m && $1 < n
        }
    }
    
    func getMaximumGold(_ grid: [[Int]]) -> Int {
        var pathLength = [Int]()
        let m = grid.count
        let n = grid.first?.count ?? 0
        var grid = grid
        
        func helper(curr: (Int, Int)) -> Int {
            let ori = grid[curr.0][curr.1]
            grid[curr.0][curr.1] = 0
            
            let dirArr = getDirArr(curr: curr, m: m, n: n)
            var maxGold = 0
            for dir in dirArr {
                if grid[dir.0][dir.1] != 0 {
                    maxGold = max(maxGold, helper(curr: dir))
                }
            }
            
            grid[curr.0][curr.1] = ori
            return ori+maxGold
        }
        
        for i in 0..<grid.count {
            for j in 0..<grid[i].count {
                if grid[i][j] == 0 {continue}
                pathLength.append( helper(curr: (i, j)))
                print(pathLength)
            }
        }
        
        return pathLength.max() ?? 0
    }
}

Solution().getMaximumGold([[0,6,0],[5,8,7],[0,9,0]])

Solution().getMaximumGold([[1,0,7],[2,0,6],[3,4,5],[0,3,0],[9,0,20]])

Solution().getMaximumGold([[0,0,34,0,5,0,7,0,0,0],[0,0,0,0,21,0,0,0,0,0],[0,18,0,0,8,0,0,0,4,0],[0,0,0,0,0,0,0,0,0,0],[15,0,0,0,0,22,0,0,0,21],[0,0,0,0,0,0,0,0,0,0],[0,7,0,0,0,0,0,0,38,0]])

Solution().getMaximumGold([[5,3,36,26,27],[11,31,23,30,4],[5,7,21,38,10],[39,30,10,17,13],[16,0,0,26,1],[25,0,10,0,0]])
