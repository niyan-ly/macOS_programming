//
//  DataModel.swift
//  nsarray_control
//
//  Created by nuc_mac on 2019/9/5.
//  Copyright © 2019 nuc_mac. All rights reserved.
//

import Cocoa

class DataModel: NSObject {
    @objc dynamic var name: String = "name" {
        didSet {
            print(self.name)
        }
    }
    @objc dynamic var raise: Float = 0.3
    
    override func setNilValueForKey(_ key: String) {
        super.setNilValueForKey(key)
    }
}
