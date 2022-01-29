//
//  Utilty.swift
//  Assignment_3
//
//  Created by Sanskar on 28/01/22.
//

import Foundation

class Utility
{
    static func getNode() -> Int //input one node detail
    {
        print("Please enter the id of node")
        if let nodeTemp = readLine()
        {
            if let node = (Int)(nodeTemp)
            {
                if(nodes[node] == nil)
                {
                    print("Node id dont exist")
                }
                return node
            }
        }
        return -1
    }
    
    static func getNodes() -> (first : Int , second : Int) //input two node details
    {
        print("Enter the parent id of Node")
        if let n1 = readLine()
        {
            if let node1 = (Int)(n1)
            {
                print("Enter the child id of Node")
                if let n2 = readLine()
                {
                    if let node2 = (Int)(n2)
                    {
                        if(nodes[node1] == nil || nodes[node2] == nil)
                        {
                            print("Invalid node id")
                        }
                        else
                        {
                            return (node1 , node2)
                        }
                    }
                }
            }
            print(invalidChoice)
        }
        return (-1 , -1)
    }
    
    static func nodeInfo(_ node : Int)
    {
        print("Node id = \(nodes[node]!.id) ")
        print("Node name = \(nodes[node]!.name) ")
        print("Node info = \(nodes[node]!.info) ")
    }
}
