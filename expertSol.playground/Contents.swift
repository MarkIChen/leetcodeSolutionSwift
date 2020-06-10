
class UnionFind {
    var parent: [Int]
    init(_ size: Int) {
        parent = Array<Int>(0..<size)
    }
    func find(_ node: Int) -> Int {
        guard parent[node] != node else {
            return node
        }
        var current = node
        while parent[current] != current {
            current = parent[current]
        }
        // accelerate
        var temp = node
        while parent[temp] != current {
            (parent[temp],temp) = (current,parent[temp])
        }
        return current
    }
    func connected(_ node1: Int, _ node2: Int) -> Bool {
        return find(node1) == find(node2)
    }
    func join(_ node1: Int, _ node2: Int)  {
        let p1 = find(node1)
        let p2 = find(node2)
        guard p1 != p2 else {
            return
        }
        parent[p1] = p2
    }
}

class Solution {
    func minMalwareSpread(_ graph: [[Int]], _ initial: [Int]) -> Int {
        guard initial.count > 1 else {return initial[0]}
        let size = graph.count
        let uf = UnionFind(size)
        for r in 0..<size {
            for c in (r + 1)..<size {
                if graph[r][c] == 1 {
                    uf.join(r, c)
                }
            }
        }
        var compoments = Array<Int>(repeating: 0, count: size)
        for node in 0..<size {
            compoments[uf.find(node)] += 1
        }
        print(uf.parent)
        // if two elements belong to the same graph, map will only have one entry.
        var map = [Int: Set<Int>]()
        for node in initial {
            let p = uf.find(node)
            if nil == map[p] {
                map[p] = []
            }
            map[p]?.insert(node)
        }
        print(map)
        
        let sortedMap = map.sorted { (argv1, argv2) -> Bool in
            argv1.value.count < argv2.value.count
        }
        
        // only one enyty in map dic means that two element will have the same effect.
        guard sortedMap[0].value.count == 1 else {
            return initial.min()!
        }
        
        var ans = (compomentSize: -1,node: -1)
        for (p,nodes) in sortedMap {
            if nodes.count > 1 {
                break
            }
            let c = compoments[p]
            if c > ans.compomentSize {
                ans = (c,nodes.first!)
            } else if c == ans.compomentSize , ans.node > nodes.first!{
                ans.node = nodes.first!
            }
        }
        return ans.node
    }
}

Solution().minMalwareSpread([[0, 1, 0, 0, 0, 0, 0],
                             [0, 0, 1, 0, 0, 0, 0],
                             [0, 0, 0, 1, 0, 0, 0],
                             [0, 0, 0, 0, 0, 0, 0],
                             [0, 0, 0, 0, 0, 1, 0],
                             [0, 0, 0, 0, 0, 0, 1]] , [0, 1])

