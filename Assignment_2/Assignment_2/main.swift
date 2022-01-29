
//
//  main.swift
//  assignment1
//
//  Created by Sanskar on 11/01/22.
//
import Foundation

var userDictionary = [Int : User]()

let invalidChoice = "Invalid Input Choosen , Please Enter Valid Input"

func main()
{
    var temp = true // variable to know if user select exit as option
    while(temp)
    {
        print("""
             CHOOSE THE OPTION FOR OPERATION :
             
             1. Add User details.
             2. Display User details.
             3. Delete User details
             4. Exit
             
             Enter your Choice
             """)
        if let input = readLine()
        {
            if let choice = (Int)(input)
            {
                switch choice
                {
                case 1 :
                    UserHandler.add()
                    
                case 2 :
                    UserHandler.display()
                    
                case 3 :
                    UserHandler.delete()
                    
                case 4 :
                    print("THANK YOU")
                    temp = false
                default :
                    print(invalidChoice)
                }
            }
        }
        else
        {
            print(invalidChoice)
        }
    }
}

main()

