
class UnionFind {
    var parent: [Int]
    
    init(size: Int) {
        parent = Array<Int>(0..<size)
    }
    func join(_ a: Int, _ b: Int) {
        let endOfA = find(a)
        let endOfB = find(b)
        
        parent[endOfA] = endOfB
    }
    
    func find(_ start: Int) -> Int {
        var current = start
        while parent[current] != current {
            current = parent[current]
        }
        var temp = start
        while parent[temp] != current {
            // efficency exchange
            (parent[temp], temp) = (current, parent[temp])
        }
        
        return current
    }
}

class Solution {
    func minMalwareSpread(_ graph: [[Int]], _ initial: [Int]) -> Int {
        
        return 0
    }
}

let uf = UnionFind(size: 7)
uf.join(0, 1)
uf.join(1, 2)
uf.join(2, 3)

uf.join(4, 5)
uf.join(5, 6)
print(uf.parent)

uf.find(4)
uf.find(0)
print(uf.parent)

Solution().minMalwareSpread([[0, 1, 0, 0, 0, 0, 0],
                             [0, 0, 1, 0, 0, 0, 0],
                             [0, 0, 0, 1, 0, 0, 0],
                             [0, 0, 0, 0, 0, 0, 0],
                             [0, 0, 0, 0, 0, 1, 0],
                             [0, 0, 0, 0, 0, 0, 1]] , [0, 1])

