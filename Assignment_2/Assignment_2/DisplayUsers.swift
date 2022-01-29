//
//  DisplayUsers.swift
//  Assignment_2
//
//  Created by Sanskar on 25/01/22.
//

import Foundation

class DisplayUsers
{
    static func display(_ dictionary : Array<(key: Int, value: User)>)
    {
        print()
        print()
        print("-----------------------------------------------------------------------------------------")
        print()
        print("Name            Roll Number            Age                Address               Course")
        print()
        print("-----------------------------------------------------------------------------------------")
        for index in dictionary
        {
            print()
            print("\(index.value.fullName)          \(index.value.rollNumber)                 \(index.value.age)          \(index.value.address)           \(index.value.course)")
        }
        print()
    }
}
