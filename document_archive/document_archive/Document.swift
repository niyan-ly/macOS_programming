//
//  Document.swift
//  document_archive
//
//  Created by branson on 2019/9/7.
//  Copyright © 2019 branson. All rights reserved.
//

import Cocoa

class Document: NSDocument {
    
    @objc dynamic var people: Human = Human()

    override init() {
        super.init()
        // Add your subclass-specific initialization here.
    }

    override class var autosavesInPlace: Bool {
        return true
    }

    override var windowNibName: NSNib.Name? {
        // Returns the nib file name of the document
        // If you need to use a subclass of NSWindowController or if your document supports multiple NSWindowControllers, you should remove this property and override -makeWindowControllers instead.
        return NSNib.Name("Document")
    }

    override func data(ofType typeName: String) throws -> Data {
        // Insert code here to write your document to data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override fileWrapper(ofType:), write(to:ofType:), or write(to:ofType:for:originalContentsURL:) instead.
//        throw NSError(domain: NSOSStatusErrorDomain, code: unimpErr, userInfo: nil)
        do {
            return try NSKeyedArchiver.archivedData(withRootObject: people, requiringSecureCoding: false)
        } catch {
            throw error
        }
    }

    override func read(from data: Data, ofType typeName: String) throws {
        // Insert code here to read your document from the given data of the specified type, throwing an error in case of failure.
        // Alternatively, you could remove this method and override read(from:ofType:) instead.
        // If you do, you should also override isEntireFileLoaded to return false if the contents are lazily loaded.
        do {
            people = try NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(data) as! Human
        } catch {
            throw error
        }
    }


}

