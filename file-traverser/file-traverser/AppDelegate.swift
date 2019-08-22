//
//  AppDelegate.swift
//  file-traverser
//
//  Created by nuc_mac on 2019/8/22.
//  Copyright © 2019 nuc_mac. All rights reserved.
//

import Cocoa

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var tableView: NSTableView?
    var dialog: NSOpenPanel?
    var folderContents: [String] = []


    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        
        return true
    }
    
    @IBAction func openDocument(_ sender: Any) {
        dialog = NSOpenPanel();
        dialog?.title                   = "Choose a .txt file";
        dialog?.showsResizeIndicator    = true;
        dialog?.showsHiddenFiles        = false;
        dialog?.canChooseDirectories    = true;
        dialog?.canChooseFiles = false;
        dialog?.allowsMultipleSelection = false;
        dialog?.beginSheetModal(for: window, completionHandler: { (res) in
            guard res == .OK else {
                return
            }
            
            guard let result = self.dialog?.url else {
                return
            }
            
            let folderList = Util.getContent(path: result.path)
            Util.folderContents = folderList ?? []
            self.tableView?.reloadData()
        })
    }
}

