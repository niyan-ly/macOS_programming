//
//  Util.swift
//  file-traverser
//
//  Created by nuc_mac on 2019/8/22.
//  Copyright © 2019 nuc_mac. All rights reserved.
//

import Cocoa

struct FolderDetail {
    var name: String
    var type: FileAttributeType
    var icon: NSImage
    var url: URL
}

class Util: NSObject {
    static var folderContents: [FolderDetail] = []
    
    static func getContent(path: String) -> [FolderDetail]? {
        let start = CFAbsoluteTimeGetCurrent()
        let pathURL = URL(fileURLWithPath: path)
        let contentNameList = try? FileManager.default.contentsOfDirectory(atPath: path)
        let details = contentNameList?.map({ (name) -> FolderDetail in
            let itemURL = URL(fileURLWithPath: name, relativeTo: pathURL)
            let attrs = try? FileManager.default.attributesOfItem(atPath: itemURL.path)
            return FolderDetail(name: name, type: attrs?[FileAttributeKey.type] as! FileAttributeType, icon: NSWorkspace.shared.icon(forFile: itemURL.path), url: itemURL)
        })
        let end = CFAbsoluteTimeGetCurrent()
        print("time of searching: \(end - start)")
        return details
    }
}
