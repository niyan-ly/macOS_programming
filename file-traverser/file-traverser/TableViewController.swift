//
//  TableViewController.swift
//  file-traverser
//
//  Created by nuc_mac on 2019/8/22.
//  Copyright © 2019 nuc_mac. All rights reserved.
//

import Cocoa

class TableViewController: NSViewController, NSTableViewDataSource, NSTableViewDelegate {

    @IBOutlet weak var tableView: NSTableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
    func numberOfRows(in tableView: NSTableView) -> Int {
        return Util.folderContents.count
    }
    
    func tableView(_ tableView: NSTableView, viewFor tableColumn: NSTableColumn?, row: Int) -> NSView? {
        guard let vw = tableView.makeView(withIdentifier: tableColumn!.identifier, owner: self) as? NSTableCellView else {
            return nil
        }
        
        vw.textField?.stringValue = Util.folderContents[row]
        return vw
    }
}
