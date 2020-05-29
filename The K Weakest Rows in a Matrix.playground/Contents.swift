import UIKit

class Solution {
    struct Item {
        let row: Int
        let number: Int
    }
    func kWeakestRows(_ mat: [[Int]], _ k: Int) -> [Int] {
        var record  = [Item]()
        for row in 0..<mat.count {
            var counter = 0
            for col in 0..<mat[row].count {
                if mat[row][col] == 1 {counter += 1}
            }
            record.append(Item(row: row, number: counter))
        }
        
        let sortedResult = record.sorted {$0.number < $1.number}
        
        var ans = [Int]()
        for i in 0..<k {
            ans.append(sortedResult[i].row)
        }
        
        return ans
    }
}


Solution().kWeakestRows([[1,1,0,0,0],
[1,1,1,1,0],
[1,0,0,0,0],
[1,1,0,0,0],
[1,1,1,1,1]], 3)

Solution().kWeakestRows([[1,0,0,0],
[1,1,1,1],
[1,0,0,0],
[1,0,0,0]], 2)
