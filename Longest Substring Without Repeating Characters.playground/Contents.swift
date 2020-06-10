import UIKit
class Solution {
    func lengthOfLongestSubstring(_ s: String) -> Int {
        var longestLength = 0
        var candidateDic = [Character: Int]()
        
        let inputArr = Array(s)
        var start = 0
        
        for index in 0..<inputArr.count {
            if let lastIndex = candidateDic[inputArr[index]] {
                if lastIndex >= start {
                    let newLength = index - start
                    if newLength > longestLength {
                        longestLength = newLength
                    }
                    start = lastIndex + 1
                }
            }
            candidateDic[inputArr[index]] = index
        }
        
        let newLength = inputArr.count - start
        if newLength > longestLength {
            longestLength = newLength
        }
        return longestLength
    }
}

print(Solution().lengthOfLongestSubstring("abcabcbb"))

print(Solution().lengthOfLongestSubstring("dvdf"))

print(Solution().lengthOfLongestSubstring(" "))
