import UIKit

let a = 1
class TreeNode {
    var val: Int
    var left: TreeNode?
    var right: TreeNode?
    init() { self.val = 0; self.left = nil; self.right = nil; }
    init(_ val: Int) { self.val = val; self.left = nil; self.right = nil; }
    init(_ val: Int, _ left: TreeNode?, _ right: TreeNode?) {
        self.val = val
        self.left = left
        self.right = right
    }
}

class Solution {
    func distributeCoins(_ root: TreeNode?) -> Int {
        
        var moves = 0
        func helper(_ curr: TreeNode) -> Int {
            var leftCount = 0
            var rightCount = 0
            if let leftNode = curr.left {leftCount =  helper(leftNode)}
            if let rightNode = curr.right {rightCount = helper(rightNode)}
           
            moves += abs(leftCount) + abs(rightCount)
            return leftCount + rightCount + curr.val - 1
        }
        
        helper(root!)
        return moves
    }
}

let root = TreeNode(0)
root.left = TreeNode(0, TreeNode(4), TreeNode(0))
root.right = TreeNode(0, TreeNode(3), TreeNode(0))

Solution().distributeCoins(root)
