import UIKit

class Solution {
    class Node {
        let nodeName: String
        var childList = [Node]()
        init(name: String) {
            self.nodeName = name
        }
    }
    
    func getToken(_ input: String) -> [String] {
        let inputArr = Array(input)
        var ans = [String]()
        
        func helper(start: Int = 0) {
            let index = inputArr[start...].firstIndex(of: "\n")
            
            if let index = index {
                ans.append(String(inputArr[start..<index]))
                helper(start: index+1)
            } else {
                ans.append(String(inputArr[start...]))
                return
            }
        }
        
        helper()
        return ans
    }
    
    func constructTree(tokenList: [String]) -> Node {
        let root = Node(name: tokenList[0])
        
        for var token in tokenList[1...] {
            if let range = token.range(of: "    ") {
                if !token.contains("\t") {
                    token = token[..<range.lowerBound] + "\t" + token[range.upperBound...]
                }
            }
            // get layer
            var layer = 0
            let charArr = Array(token)
            
            var index = 0
            while true {
                if let temp = charArr[index...].firstIndex(of: "\t") {
                    layer += 1
                    index = temp + 1
                } else {break}
            }
            print(token, layer)
            
            var nodePointer = root
            if layer >= 1 {
                for _ in 0..<(layer) {
                    if let last = nodePointer.childList.last {
                        nodePointer = last
                    } else {
                        print("error")
                    }
                }
            }
            
            nodePointer.childList.append(Node(name: String(Array(token)[layer...])))
        }
        return root
    }
    
    func getDirList(root: Node) -> [Int] {
        var curr = root
        var ans = [Int]()
        
        func helper(dir: String) {
            let newDir = dir + "/" + curr.nodeName
            if curr.childList.count == 0 {
                if Array(curr.nodeName).contains(".") {
                    ans.append(newDir.count-6)
                }
            }
            for node in curr.childList {
                curr = node
                helper(dir: newDir)
            }
        }
        helper(dir: "")
        return ans
    }
    
    func lengthLongestPath(_ input: String) -> Int {
        
        let newInput = "root\n"+input
//        let tokenList = getToken(newInput)
        
//        let tokenList = newInput.split(separator: "\n").map {String($0)}
        
         let tokenList = newInput.components(separatedBy: "\n")
        
        let root = constructTree(tokenList: tokenList)
        let list = getDirList(root: root)
        
        return list.max() ?? 0
    }
}

Solution().lengthLongestPath("dir\n\tsubdir1\n\t\tfile1.ext\n\t\tsubsubdir1\n\tsubdir2\n\t\tsubsubdir2\n\t\t\tfile2.ext")

Solution().lengthLongestPath("dir\n\t        file.txt\n\tfile2.txt")

Solution().lengthLongestPath("a\n\tb.txt\na2\n\tb2.txt")

