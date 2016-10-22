//
//  ViewController.swift
//  JSONExample
//
//  Created by Chakery on 10/22/16.
//  Copyright © 2016 Chakery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        var students: [Student] = []
        (1..<3).forEach {
            let no = "12123301\($0)"
            let name = "学生-\($0)"
            let age = Int(arc4random() % 5 + 18)
            let birthday = NSDate()
            let s = Student(no: no, name: name, age: age, birthday: birthday)
            students.append(s)
        }
        
        let teacher = Teacher(no: "0001-3982-3309-1104", name: "张老师", age: 30, birthday: NSDate(), students: students)
        
        if let jsonStr = teacher.toJSONString() {
            print(jsonStr)
        }
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
}

// --------------------- Test Model ------------------------


class Personal: CGYJSON {
    var name: String
    var age: Int
    var birthday: NSDate
    
    init(name: String, age: Int, birthday: NSDate) {
        self.name = name
        self.age = age
        self.birthday = birthday
    }
}


class Student: Personal {
    var student_no: String
    
    init(no: String, name: String, age: Int, birthday: NSDate) {
        self.student_no = no
        super.init(name: name, age: age, birthday: birthday)
    }
    
}

class Teacher: Personal {
    var teacher_no: String
    var students: [Student]
    
    init(no: String, name: String, age: Int, birthday: NSDate, students: [Student]) {
        self.teacher_no = no
        self.students = students
        super.init(name: name, age: age, birthday: birthday)
    }
}





