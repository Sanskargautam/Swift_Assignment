//
//  Validator.swift
//  Assignment_2
//
//  Created by Sanskar on 21/01/22.
//

import Foundation

class Validator
{
    static var countOfCourse = [Int](repeating : 1 , count : 6)
    
    static func validCourse(course: String) ->Bool
    {
        switch course
        {
        case "A" :
            countOfCourse[0] -= 1
            return (countOfCourse[0] == 0)
        case "B" :
            countOfCourse[1] -= 1
            return (countOfCourse[1] == 0)
        case "C" :
            countOfCourse[2] -= 1
            return (countOfCourse[2] == 0)
        case "D" :
            countOfCourse[3] -= 1
            return (countOfCourse[3] == 0)
        case "E" :
            countOfCourse[4] -= 1
            return (countOfCourse[4] == 0)
        case "F" :
            countOfCourse[5] -= 1
            return (countOfCourse[5] == 0)
            
        default:
            return false
        }
    }
    
    static func validateCourse(courseArray: [String]) -> Bool
    {
        var count = 0 //count for course opted
        for index in courseArray
        {
            if(validCourse(course: index))
            {
                count+=1
            }
        }
        if(count == 4)
        {
            return true
        }
        else
        {
            countOfCourse = [Int](repeating : 1 , count : 6)
            return false
        }
    }
    
    static func existingRollNumber(rollNumber : Int) -> Bool
    {
        return userDictionary[rollNumber] != nil
    }
    
    static func validateage(age: Int) -> Bool
    {
        return (age >= 0 && age < 100)
    }
}
