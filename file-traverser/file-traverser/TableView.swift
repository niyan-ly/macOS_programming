//
//  TableView.swift
//  file-traverser
//
//  Created by nuc_mac on 2019/8/29.
//  Copyright © 2019 nuc_mac. All rights reserved.
//

import Cocoa

@objc protocol QuickLookTableDelegate {
    func didPressSpaceBarForTableView(_ sender: NSView)
}

class QuickLookTableView: NSTableView {
    
    @IBOutlet weak var qDelegate: QuickLookTableDelegate?

    override func draw(_ dirtyRect: NSRect) {
        super.draw(dirtyRect)

        // Drawing code here.
    }
    
    override func keyDown(with event: NSEvent) {
        if event.characters == " " {
            self.qDelegate?.didPressSpaceBarForTableView(self)
        } else {
            super.keyDown(with: event)
        }
    }
}
