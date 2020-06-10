import UIKit

class Solution {
    func canReach(_ arr: [Int], _ start: Int) -> Bool {
        var set = Set<Int>()
        var visited = [Int]()
        
        set.insert(start)
        while visited.count <= arr.count && set.count > 0 {
            for index in set {
                if arr[index] == 0 {return true}
                visited.append(index)
                set.remove(index)
                
                let offset = arr[index]
                let right = index + offset
                let left = index - offset
               
                if !visited.contains(right) && right < arr.count {set.insert(right)}
                if !visited.contains(left) && left >= 0 {set.insert(left)}
            }
        }
        
        return false
    }
}

print(Solution().canReach([4,2,3,0,3,1,2], 0))

print(Solution().canReach([3,0,2,1,2], 2))
