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
    @objc dynamic var employees: [DataModel] = []

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
}

