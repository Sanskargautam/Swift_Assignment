//
//  UserHandler.swift
//  Assignment_2
//
//  Created by Sanskar on 25/01/22.
//

import Foundation

class UserHandler
{
    //function to add user details
    
    static func add()
    {
        var fullName : String?
        var address : String?
        var age : Int?
        var rollNumber : Int?
        var courseArray : [String]?
        var flag = true
        
        print()
        flag = true
        while(flag)      //took first input rollnumber bcoz it should be unique
        {
            print("Please Enter the roll number")
            if let tempRollNumber = readLine()
            {
                if let tempIntRollNumber = (Int)(tempRollNumber)
                {
                    if(Validator.existingRollNumber(rollNumber: tempIntRollNumber))
                    {
                        print("Roll Number already exists")
                        continue
                    }
                    rollNumber = tempIntRollNumber
                    flag = false
                }
                else
                {
                    print(invalidChoice)
                }
            }
            else
            {
                print(invalidChoice)
            }
        }
        print()
        
        flag = true
        while(flag)
        {
            print("Please Enter the name")
            if let tempFullName = readLine()
            {
                if(tempFullName.isEmpty)
                {
                    print(invalidChoice)
                    continue
                }
                fullName = tempFullName
                flag = false
            }
            else
            {
                print(invalidChoice)
            }
        }
        print()
        
        flag = true
        while(flag)
        {
            print("Please Enter the age")
            if let tempAgeString = readLine()
            {
                if let tempAge = (Int)(tempAgeString)
                {
                    if(!Validator.validateage(age: tempAge))
                    {
                        print(invalidChoice)
                        continue
                    }
                    
                    age = tempAge
                    flag = false
                }
                else
                {
                    print(invalidChoice)
                }
            }
            else
            {
                print(invalidChoice)
            }
        }
        print()
        
        flag = true
        while(flag)
        {
            print("Please Enter the address")
            if let tempAddress = readLine()
            {
                address = tempAddress
                flag = false
            }
            else
            {
                print(invalidChoice)
            }
        }
        print()
        
        flag = true
        while(flag)
        {
            print("Please enter the 4 courses you want to opt amoung space separated manner (A , B , C , D , E , F ")
            if let course = readLine()
            {
                courseArray = course.components(separatedBy: " ")
                if(!Validator.validateCourse(courseArray: courseArray!))
                {
                    print("Invalid course/number of course selected selected")
                    continue
                }
                else
                {
                    flag = false
                }
            }
        }
        print()
        
        if let tempname = fullName , let tempaddress = address , let tempage = age , let temproll = rollNumber , let tempcourse = courseArray
        {
            let obj = User.init(tempname, tempaddress, tempage, temproll, tempcourse)
            userDictionary[obj.rollNumber] = obj
        }
    }
    
    //----------------------------------------------------------------------------------------------------------------------//
    
    //User function to diplay details
    
    //----------------------------------------------------------------------------------------------------------------------//
    
    static func display()
    {
        var flag = true
        while(flag)
        {
            if(userDictionary.count == 0)
            {
                print("No data to show")
                break
            }
            
            print("""
             CHOOSE THE OPTION IN WHICH YOU WANT TO SEE DATA:
             
             1. Based on name (Ascending).
             2. Based on name (Descending).
             3. Based on rollNumber (Ascending).
             4. Based on rollNumber (Descending).
             5. Based on address (Ascending).
             6. Based on address (Descending).
             7. Based on age (Ascending).
             8. Based on age (Descending).
             """)
            
            if let input = readLine()
            {
                if let inputInt = (Int)(input)
                {
                    switch inputInt
                    {
                    case 1 , 2 :
                        let sortedByName = userDictionary.sorted { (($0.1.fullName < $1.1.fullName) && (inputInt%2==1)) }
                        DisplayUsers.display(sortedByName)
                        flag = false
                        
                    case 3 , 4:
                        let sortedByRollNumber = userDictionary.sorted { (($0.1.rollNumber < $1.1.rollNumber) && (inputInt%2==1)) }
                        DisplayUsers.display(sortedByRollNumber)
                        flag = false
                        
                    case 5 , 6:
                        let sortedByAddress = userDictionary.sorted { (($0.1.address < $1.1.address) && (inputInt%2==1)) }
                        DisplayUsers.display(sortedByAddress)
                        flag = false
                        
                    case 7 , 8:
                        let sortedByAge = userDictionary.sorted { (($0.1.fullName < $1.1.fullName) && (inputInt%2==1)) }
                        DisplayUsers.display(sortedByAge)
                        flag = false
                        
                    default:
                        print(invalidChoice)
                    
                    }
                }
                else
                {
                    print(invalidChoice)
                }
            }
            else
            {
                print(invalidChoice)
            }
        }
    }
    
    //----------------------------------------------------------------------------------------------------------------------//
    
    //User function to delete user details
    
    //----------------------------------------------------------------------------------------------------------------------//


    static func delete()
    {
        print("Enter the roll number of user you want to delete")
        if let roll = readLine()
        {
           if let intRoll = (Int)(roll)
           {
               if(!Validator.existingRollNumber(rollNumber: intRoll))
               {
                   print("User with roll number \(intRoll) does not exist")
                   return
               }
               userDictionary[intRoll] = nil
               print()
               print("Successfully Deleted")
               return
            }
        }
        print(invalidChoice)
    }
}
