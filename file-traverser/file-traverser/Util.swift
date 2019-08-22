//
//  Util.swift
//  file-traverser
//
//  Created by nuc_mac on 2019/8/22.
//  Copyright © 2019 nuc_mac. All rights reserved.
//

import Cocoa

class Util: NSObject {
    static var folderContents: [String] = []
    
    static func getContent(path: String) -> [String]? {
        let start = CFAbsoluteTimeGetCurrent()
        let content = try? FileManager.default.contentsOfDirectory(atPath: path)
        let end = CFAbsoluteTimeGetCurrent()
        print("time of searching: \(end - start)")
        return content
    }
}
