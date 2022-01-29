
//
//  main.swift
//  assignment1
//
//  Created by Sanskar on 11/01/27.
//
import Foundation

let invalidChoice = "Invalid Input Choosen , Please Enter Valid Input"

func main()
{
    var temp = true // variable to know if user select exit as option
    repeat
    {
        print("""
             CHOOSE THE OPTION FOR OPERATION :
             
             1. Add Node to the graph
             2. Add dependency to the graph
             3. Delete node to the graph
             4. Delete dependency to the graph
             5. Get descendants of node
             6. Get ancestors of node
             7. Get immediate parents
             8. Get immediate children
             9. Exit
             
             Enter your Choice
             """)
        if let input = readLine()
        {
            if let choice = (Int)(input)
            {
                switch choice
                {
                case 1 :
                    Operation.addNode()
                    
                case 2 :
                    let (node1, node2) = Utility.getNodes()
                    if(node1 != -1 && node2 != -1)
                    {
                        Operation.addEdge(node1 , node2)
                    }
                    
                case 3 :
                    let node = Utility.getNode()
                    if(node != -1)
                    {
                        Operation.removeNode(node)
                    }
                    
                case 4 :
                    let node1 = Utility.getNodes().first
                    let node2 = Utility.getNodes().second
                    if(node1 != -1 && node2 != -1)
                    {
                        Operation.removeEdge(node1 , node2)
                    }
                    
                case 5 :
                    let node = Utility.getNode()
                    if(node != -1)
                    {
                        Operation.getDescendents(node)
                    }
                    
                case 6 :
                    let node = Utility.getNode()
                    if(node != -1)
                    {
                        Operation.getAncestors(node)
                    }
                    
                case 7 :
                    let node = Utility.getNode()
                    if(node != -1)
                    {
                        Operation.getImmediateParent(node)
                    }
                    
                case 8 :
                    let node = Utility.getNode()
                    if(node != -1)
                    {
                        Operation.getImmediateChild(node)
                    }
                    
                case 9 :
                    print("THANK YOU")
                    temp = false
                    
                case 10:
                    print(children)
                    print(parent)
                    print(nodes)
                    
                default :
                    print(invalidChoice)
                }
            }
        }
        
        else
        {
            print(invalidChoice)
        }
        
    }while(temp)
}

main()

