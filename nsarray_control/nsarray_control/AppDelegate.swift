//
//  AppDelegate.swift
//  nsarray_control
//
//  Created by nuc_mac on 2019/9/5.
//  Copyright © 2019 nuc_mac. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @objc dynamic var employees: [DataModel] = [] {
        didSet {
            print(self.employees[0].name)
        }
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    @IBAction func printEmployee(_ sender: Any) {
        for item in employees {
            print("name: \(item.name), raise: \(item.raise)")
        }
    }
}

