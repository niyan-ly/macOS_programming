//
//  AppDelegate.swift
//  file-traverser
//
//  Created by nuc_mac on 2019/8/22.
//  Copyright © 2019 nuc_mac. All rights reserved.
//

import Cocoa
import CoreGraphics
import Quartz

@NSApplicationMain
class AppDelegate: NSObject, NSApplicationDelegate, NSSplitViewDelegate, QuickLookTableDelegate, QLPreviewPanelDataSource {
    @IBOutlet weak var window: NSWindow!
    @IBOutlet weak var tableView: NSTableView!

    var dialog: NSOpenPanel?
    
    func numberOfPreviewItems(in panel: QLPreviewPanel!) -> Int {
        return tableView.selectedRowIndexes.count
    }
    
    func previewPanel(_ panel: QLPreviewPanel!, previewItemAt index: Int) -> QLPreviewItem! {
        return Util.folderContents[tableView.selectedRow].url as QLPreviewItem
    }
    
    override func acceptsPreviewPanelControl(_ panel: QLPreviewPanel!) -> Bool {
        return true
    }
    
    override func beginPreviewPanelControl(_ panel: QLPreviewPanel!) {
        panel.dataSource = self
    }
    
    override func endPreviewPanelControl(_ panel: QLPreviewPanel!) {
        panel.dataSource = nil
    }
    
    func didPressSpaceBarForTableView(_ sender: NSView) {
        guard let sharedQLPanel = QLPreviewPanel.shared() else {
            return
        }
        
        if QLPreviewPanel.sharedPreviewPanelExists() && sharedQLPanel.isVisible {
            sharedQLPanel.orderOut(self)
        } else {
            sharedQLPanel.makeKeyAndOrderFront(self)
            sharedQLPanel.reloadData()
        }
    }

    func applicationDidFinishLaunching(_ aNotification: Notification) {
        // Insert code here to initialize your application
    }

    func applicationWillTerminate(_ aNotification: Notification) {
        // Insert code here to tear down your application
    }
    
    func applicationShouldHandleReopen(_ sender: NSApplication, hasVisibleWindows flag: Bool) -> Bool {
        window.makeKeyAndOrderFront(self)
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
    
    func splitView(_ splitView: NSSplitView, constrainMinCoordinate proposedMinimumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return proposedMinimumPosition + 200
    }
    
    func splitView(_ splitView: NSSplitView, constrainMaxCoordinate proposedMaximumPosition: CGFloat, ofSubviewAt dividerIndex: Int) -> CGFloat {
        return proposedMaximumPosition - 120
    }
}

