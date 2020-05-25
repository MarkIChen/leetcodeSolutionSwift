import Foundation

class Solution {
    
    var list: [Int] = Array(repeating: 0, count: 501)
    var possibleList = [Int]()
    

    init() {
        var possible = 60
        while possible < 1000 {
            possibleList.append(possible)
            possible += 60
        }
    }
    
    func numPairsDivisibleBy60(_ time: [Int]) -> Int {
        
        for num in time {
            list[num] += 1
        }
        
        var count = 0
        for number in 1..<list.count {
            if list[number] > 0 {
                for possible in possibleList {
                    let complement = possible - number
                    if complement < 0 || complement >= 501 {continue}
                    if list[complement] < 1 {continue}
                    if complement == number {count += list[number]*(list[number]-1)/2}
                    else if complement > number {
                        count += (list[number] * list[complement])
                        print(complement, number)
                    }
                }
            }
        }
        
        
        return count
    }
}


print(Solution().numPairsDivisibleBy60([60,60,60]))

print(Solution().numPairsDivisibleBy60([30,20,150,100,40]))
