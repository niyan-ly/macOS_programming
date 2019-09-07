//
//  Human.swift
//  document_archive
//
//  Created by branson on 2019/9/7.
//  Copyright © 2019 branson. All rights reserved.
//

import Cocoa

//@objc enum Gender: Int {
//    case Male
//    case Female
//}

class Human: NSObject, NSCoding {
    func encode(with aCoder: NSCoder) {
        aCoder.encode(gender, forKey: "gender")
        aCoder.encode(name, forKey: "name")
        aCoder.encode(age, forKey: "age")
    }
    
    required init?(coder aDecoder: NSCoder) {
        age = aDecoder.decodeInteger(forKey: "age")
        gender = aDecoder.decodeObject(forKey: "gender") as! String
        name = aDecoder.decodeObject(forKey: "name") as! String
    }
    
    @objc dynamic var gender: String
    @objc dynamic var name: String
    @objc dynamic var age: Int
    
    override init() {
        gender = "Female"
        name = "default"
        age = 16
    }
}
