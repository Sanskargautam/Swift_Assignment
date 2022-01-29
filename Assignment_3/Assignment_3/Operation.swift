//
//  sdfsf.swift
//  Assignment_3
//
//  Created by Sanskar on 27/01/22.
//

import Foundation

var parent = [Int : Set<Int>]() //stores immediate parents of node
var children = [Int : Set<Int>]() //stores immediate childrens of node
var nodes = [Int : Node]()

class Operation
{
    static func addNode()
    {
        print("Enter the name for the node")
        if let name = readLine()
        {
            print("Enter the additional info for the node")
            if let info = readLine()
            {
                let n = nodes.count //node id
                nodes[n] = Node.init(n , name , info)
                parent[n] = []
                children[n] = []
                return
            }
            print(invalidChoice)
        }
    }
    
    static var visited = [Int : Bool]()
    static func cyclicExist(_ node : Int) -> Bool
    {
        if(visited[node] == true)
        {
            return true
        }
        visited[node] = true
        var flag = false
        for nodes in parent[node] ?? []
        {
            flag = flag || cyclicExist(nodes)
        }
        return flag
    }
    
    static func addEdge(_ node1 : Int , _ node2 : Int)
    {
        addEdgeChildren(node1 , node2)
        visited.removeAll()
        if(cyclicExist(node1))
        {
            print("Can not add edge because of cycle existance")
            children[node1]?.remove(node2)
            return
        }
        
        addEdgeParent(node1 , node2)
    }
    
    static func addEdgeParent(_ node1 : Int , _ node2 : Int)
    {
        parent[node2]?.insert(node1)
    }
    
    static func addEdgeChildren(_ node1 : Int , _ node2 : Int)
    {
        children[node1]?.insert(node2)
    }
    
    static func getDescendents(_ node : Int)
    {
        Utility.nodeInfo(node)
        for nodes in children[node] ?? []
        {
            getDescendents(nodes)
        }
    }
    
    static func getAncestors(_ node : Int)
    {
        Utility.nodeInfo(node)
        for nodes in parent[node] ?? []
        {
            getAncestors(nodes)
        }
    }
    
    static func getImmediateChild(_ node : Int)
    {
        Utility.nodeInfo(node)
        for nodes in children[node] ?? []
        {
            Utility.nodeInfo(nodes)
        }
    }
    
    static func getImmediateParent(_ node : Int)
    {
        Utility.nodeInfo(node)
        for nodes in parent[node] ?? []
        {
            Utility.nodeInfo(nodes)
        }
    }
    
    static func removeEdge(_ node1 : Int , _ node2 : Int)
    {
        children[node1] = nil
        parent[node2] = nil
    }
    
    static func removeNode(_ node : Int)
    {
        children[node] = nil
        parent[node] = nil
        nodes[node] = nil
        for nodes in children.keys
        {
            if(children[nodes]!.contains(node))
            {
                children[nodes]?.remove(node)
            }
        }
        print("Successfully deleted")
        
    }
}
