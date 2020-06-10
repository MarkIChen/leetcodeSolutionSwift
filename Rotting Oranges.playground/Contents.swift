import UIKit

class Solution {
    func orangesRotting(_ grid: [[Int]]) -> Int {
        var grid = grid
        var rottenQueue = [(Int, Int)]()
        let m = grid.count
        let n = grid.first?.count ?? 0
        
        //find rotten orange
        var goodOrangeCounter = 0
        for r in 0..<grid.count {
            for c in 0..<grid[r].count {
                if grid[r][c] == 2 {rottenQueue.append((r, c))}
                if grid[r][c] == 1 {goodOrangeCounter+=1}
            }
        }
        if rottenQueue.count == 0 && goodOrangeCounter > 0 {return -1}
        // spread the virus
        var counter = 0

        while rottenQueue.count > 0 {
            var nextRottenQueue = [(Int, Int)]()
            for (r, c) in rottenQueue {
                let candidates = [(r-1, c), (r, c+1), (r+1, c), (r, c-1)]
                                    .filter {$0 >= 0 && $0 < m && $1 >= 0 && $1 < n && grid[$0][$1] == 1}
                candidates.forEach {
                    grid[$0][$1] = 2
                    goodOrangeCounter-=1
                }
                nextRottenQueue += candidates
            }
        
            rottenQueue = nextRottenQueue
            if rottenQueue.count > 0 {counter+=1}
        }

        if goodOrangeCounter != 0 {return -1}
        return counter
    }
}

Solution().orangesRotting([[2,1,1],[1,1,0],[0,1,1]])

Solution().orangesRotting([[0]])

Solution().orangesRotting([[2,1,1],[0,1,1],[1,0,1]])

Solution().orangesRotting([[2],[2],[1],[0],[1],[1]])
