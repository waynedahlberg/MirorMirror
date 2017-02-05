//
//  EntryStore.swift
//  BodyShotz
//
//  Created by Wayne Dahlberg on 2/4/17.
//  Copyright © 2017 PineBit Studios. All rights reserved.
//

import UIKit

class EntryStore {
    
    var allEntries = [Entry]()
    let today = TimeInterval.self
    
    // Closure returns a URL of all the filesystem when a new instance of EntryStore is created
    let entryArchiveURL: URL = {
        let documentsDirectories = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        let documentDirectory = documentsDirectories.first!
        return documentDirectory.appendingPathComponent("items.archive")
    }() // We now have a place to save data on the file system and a model object to be saved. 
        // to save instances of Entry, use NSKeyedArchiver when app 'exits'
    
    // MARK: - Load items store in memory if any
    init() {
        if let archivedEntries = NSKeyedUnarchiver.unarchiveObject(withFile: entryArchiveURL.path) as? [Entry] {
            allEntries = archivedEntries
        }
    }
    
    @discardableResult func createEntry() -> Entry {
        let newEntry = Entry()
        allEntries.append(newEntry)
        
        return newEntry
    }
    
    // Deleting items
    
    
    // MARK: - Saving and loading
    
    func saveChanges() -> Bool {
        print("Saving items to: \(entryArchiveURL.path)")
        return NSKeyedArchiver.archiveRootObject(allEntries, toFile: entryArchiveURL.path)
    }
    
    
    
    
    
    
}
