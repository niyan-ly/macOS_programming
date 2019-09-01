//
//  SecondViewController.swift
//  view-controller
//
//  Created by branson on 2019/8/31.
//  Copyright © 2019 branson. All rights reserved.
//

import Cocoa

class InfoController: NSViewController, InitialViewSize {
    var width: CGFloat!
    var height: CGFloat!

    override func viewDidLoad() {
        super.viewDidLoad()
        print("view loaded")
        // Do view setup here.
    }
    
    override func awakeFromNib() {
        print("awake from nib")
        width = view.bounds.size.width
        height = view.bounds.size.height
    }
}
