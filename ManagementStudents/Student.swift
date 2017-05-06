//
//  Student.swift
//  ManagementStudents
//
//  Created by Tran Van Tin on 5/6/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import Foundation

class Student {
    
    var name : String!
    var university : String!
    var description : String!
    var yearOld : Int!
    
    init(name: String, university: String, description: String, yearOld: Int) {
        self.name = name
        self.university = university
        self.description = description
        self.yearOld = yearOld
    }
}
