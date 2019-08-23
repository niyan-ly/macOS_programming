//
//  AppDelegate.swift
//  file-traverser
//
//  Created by nuc_mac on 2019/8/22.
//  Copyright © 2019 nuc_mac. All rights reserved.
//

import Cocoa
import CoreGraphics

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSWindowDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var tableView: NSTableView!
    @IBOutlet weak var widthField: NSTextField!
    @IBOutlet weak var heightField: NSTextField!
    @IBOutlet weak var positionX: NSTextField!
    @IBOutlet weak var positionY: NSTextField!
    
    var dialog: NSOpenPanel?
    var folderContents: [String] = []

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }
    
    func windowDidResize(_ notification: Notification) {
        widthField.stringValue = window.frame.width.description
        heightField.stringValue = window.frame.height.description
    }
    
    func windowDidMove(_ notification: Notification) {
        positionX.stringValue = window.frame.origin.x.description
        positionY.stringValue = window.frame.origin.y.description
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationShouldTerminateAfterLastWindowClosed(_ sender: NSApplication) -> Bool {
        
        return true
    }
    
    @IBAction func resizeWindow(_ sender: NSButton) {
        guard let wantedWidth = Double(widthField.stringValue) else {
            return
        }
        
        guard let wantedHeight = Double(heightField.stringValue) else {
            return
        }

        let newOrigin = CGPoint(x: window.frame.origin.x, y: window.frame.origin.y + window.frame.height - CGFloat(wantedHeight))
//        print(wantedHeight)
        let newFrame = window.frameRect(forContentRect: NSRect(origin: newOrigin, size: CGSize(width: wantedWidth, height: wantedHeight - 22)))
//        print(CGSize(width: wantedWidth, height: wantedHeight).height.description)
        window.setFrame(newFrame, display: true, animate: true)
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

