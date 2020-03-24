//
//  EntryController.swift
//  Journal
//
//  Created by Bradley Diroff on 3/23/20.
//  Copyright © 2020 Bradley Diroff. All rights reserved.
//

import Foundation
import CoreData

class EntryController {
    
//    var entries: [Entry] {
//        return loadFromPersistentStore()
//    }
    
    func saveToPersistentStore() {
        do {
            try CoreDataStack.shared.mainContext.save()
        } catch {
            NSLog("Error saving managed object context: \(error)")
        }
    }
    
    func delete(entry: Entry) {
        
        CoreDataStack.shared.mainContext.delete(entry)
        saveToPersistentStore()
    }
    
    func create(title: String, bodyText: String, mood: FaceValue) {
        Entry(title: title, bodyText: bodyText, timeStamp: Date(), mood: mood, context: CoreDataStack.shared.mainContext)
        saveToPersistentStore()
    }
    
    func update(entry: Entry, title: String, bodyText: String, mood: FaceValue) {
        entry.title = title
        entry.bodyText = bodyText
        entry.timeStamp = Date()
        entry.mood = mood.rawValue
        saveToPersistentStore()
    }
    
    
//    func loadFromPersistentStore() -> [Entry] {
//        var allEntries: [Entry] = []
//        let fetchRequest =
//          NSFetchRequest<NSManagedObject>(entityName: "Entry")
//
//        do {
//            allEntries = try CoreDataStack.shared.mainContext.fetch(fetchRequest) as! [Entry]
//        } catch let error as NSError {
//          print("Could not fetch. \(error), \(error.userInfo)")
//        }
//        return allEntries
//    }
    
}
