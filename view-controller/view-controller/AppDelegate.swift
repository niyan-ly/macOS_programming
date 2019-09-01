//
//  AppDelegate.swift
//  view-controller
//
//  Created by branson on 2019/8/31.
//  Copyright © 2019 branson. All rights reserved.
//

import Cocoa
import CoreGraphics

protocol InitialViewSize: NSViewController {
    var width: CGFloat! { get set }
    var height: CGFloat! { get set }
}

let TOOLBAR_HEIGHT: CGFloat = 78

enum ViewControllerSet: Int {
    case first = 0
    case second
}

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSToolbarDelegate {

    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var toolBar: NSToolbar!
    var preferenceController: InitialViewSize?
    var infoController: InitialViewSize?
    var usedViewController: InitialViewSize?
    
    @IBAction func onPreferenceView(_ sender: NSButton) {
        toolBar.selectedItemIdentifier = NSToolbarItem.Identifier("Preference")
        changeView(of: .first)
    }
    
    @IBAction func onInfoView(_ sender: NSButton) {
        toolBar.selectedItemIdentifier = NSToolbarItem.Identifier("Info")
        changeView(of: .second)
    }
    
    func changeView(of viewIndex: ViewControllerSet) {
//        usedViewController?.view.removeFromSuperview()
        
        switch viewIndex {
        case .first:
            usedViewController = preferenceController
        case .second:
            usedViewController = infoController
        }
        
        window.contentView = usedViewController?.view

        let currentOrigin = window.frame.origin
        let currentSize = window.frame.size
//        print(currentSize)
        let newSize = NSSize(width: usedViewController!.width, height: usedViewController!.height)
//        print(newSize)
        let newOrigin = CGPoint(x: currentOrigin.x, y: currentOrigin.y - usedViewController!.height + currentSize.height - TOOLBAR_HEIGHT)
        let newFrame = window.frameRect(forContentRect: NSRect(origin: newOrigin, size: newSize))
        window.setFrame(newFrame, display: true, animate: true)
    }
    
    override func awakeFromNib() {
        toolBar.selectedItemIdentifier = NSToolbarItem.Identifier("Preference")
        preferenceController = PreferenceController(nibName: "PreferenceController", bundle: nil)
        infoController = InfoController(nibName: "InfoController", bundle: nil)
        changeView(of: .first)
    }
    
    func toolbarSelectableItemIdentifiers(_ toolbar: NSToolbar) -> [NSToolbarItem.Identifier] {
        return [NSToolbarItem.Identifier("Preference"), NSToolbarItem.Identifier("Info")]
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        window.makeKeyAndOrderFront(self)
        return true
    }
}

