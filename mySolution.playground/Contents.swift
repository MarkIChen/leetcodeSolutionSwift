

class Solution {

    class UnionFind {
        var parent: [Int]
        
        init(_ size: Int) {
            parent = Array<Int>(0..<size)
        }
        func join(_ a: Int, _ b: Int) {
            parent[find(a)] = find(b)
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
    func minMalwareSpread(_ graph: [[Int]], _ initial: [Int]) -> Int {
        let size = graph.count
        
        // create dusjoint set
        let uf = UnionFind(size)
        for row in 0..<size {
            for col in 0..<size {
                if graph[row][col] == 1 {uf.join(row, col)}
            }
        }
        // calculate the size of each set and store it in the final node
        var counterArr = Array(repeating: 0, count: size)
        for node in 0..<size {
            let endOfNode = uf.find(node)
            counterArr[endOfNode] += 1
        }
        print(counterArr)
        
        var map = [Int : Set<Int>]()
        for initialNode in initial {
            let endNode = uf.find(initialNode)
            if map[endNode] == nil {
                map[endNode] = Set<Int>()
            }
            map[endNode]?.insert(initialNode)
        }
        print(map)

        // sorting the map. if the set has more than two initial node, deleting is not helpful.
        var ans = (effectedNode: -1, node: initial.min()!)
        let sortedMap = map.sorted {$0.value.count < $1.value.count}
        for (endOfSet, set) in sortedMap {
            if set.count == 1 {
                if counterArr[endOfSet] > ans.effectedNode {
                    ans.effectedNode = counterArr[endOfSet]
                    ans.node = set.min()!
                }
                if counterArr[endOfSet] == ans.effectedNode && set.min()! < ans.node {
                    ans.node = set.min()!
                }
            }
        }
        
        return ans.node
    }
}

//
//Solution().minMalwareSpread([[0, 1, 0, 0, 0, 0, 0],
//                             [0, 0, 1, 0, 0, 0, 0],
//                             [0, 0, 0, 1, 0, 0, 0],
//                             [0, 0, 0, 0, 0, 0, 0],
//                             [0, 0, 0, 0, 0, 1, 0],
//                             [0, 0, 0, 0, 0, 0, 1],
//                             [0, 0, 0, 0, 0, 0, 0]] , [4, 5, 0])
//
//Solution().minMalwareSpread([[1,0,0],[0,1,0],[0,0,1]], [0,1])
////
//Solution().minMalwareSpread([[1,1,1],[1,1,1],[1,1,1]], [1, 2])
//
//Solution().minMalwareSpread([[1,0,0,0],[0,1,0,0],[0,0,1,1],[0,0,1,1]], [3, 1])

Solution().minMalwareSpread([[1,0,0,0,0,0],[0,1,0,0,0,0],[0,0,1,0,1,0],[0,0,0,1,0,0],[0,0,1,0,1,0],[0,0,0,0,0,1]]
,[4,3])
