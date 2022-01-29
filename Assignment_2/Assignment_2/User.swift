//
//  User.swift
//  Assignment_2
//
//  Created by Sanskar on 20/01/22.
//

import Foundation

class User
{
    let fullName : String
    let address : String
    let age : Int
    let rollNumber : Int
    let course : [String]
    
    init(_ fullName: String , _ address: String , _ age: Int , _ rollNumber: Int , _ course: [String])
    {
        self.fullName = fullName
        self.address = address
        self.age = age
        self.rollNumber = rollNumber
        self.course = course
    }
}
