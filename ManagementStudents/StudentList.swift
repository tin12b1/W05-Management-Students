//
//  StudentList.swift
//  ManagementStudents
//
//  Created by Tran Van Tin on 5/6/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import Foundation

class StudentList {

    init() {

    }
    
    public class func students() -> [Student] {
        var studentList: Array<Student> = []
        studentList.append(Student(name: "Tran Van Tin", university: "HCMUTE", description: "Description 1", yearOld: 25))
        studentList.append(Student(name: "Dinh Duy Hiep", university: "HUTECH", description: "Description 1", yearOld: 22))
        studentList.append(Student(name: "Nguyen Van Nhan", university: "FTU", description: "Description 1", yearOld: 21))
        studentList.append(Student(name: "Nguyen Hoang Huy", university: "UTC2", description: "Description 1", yearOld: 24))
        studentList.append(Student(name: "Trinh Van Phi", university: "HCMUTE", description: "Description 1", yearOld: 25))
        studentList.append(Student(name: "Le Thi Ha", university: "NLU", description: "Description 1", yearOld: 25))
        studentList.append(Student(name: "Phan Hoang Long", university: "HCMUTE", description: "Description 1", yearOld: 21))
        studentList.append(Student(name: "Tran Huynh Nhu", university: "RMIT", description: "Description 1", yearOld: 22))
        studentList.append(Student(name: "Nguyen Anh Thu", university: "HCMUTE", description: "Description 1", yearOld: 21))
        studentList.append(Student(name: "Kha Van Can", university: "NTTU", description: "Description 1", yearOld: 23))
        return studentList
    }
    
    
}
