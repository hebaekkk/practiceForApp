//
//  Persistence.swift
//  BookWormPractice
//
//  Created by BigHand on 2021/01/26.
//

import Foundation

struct PersistenceController {
    static let shared = PersistenceController()
    
    static var preview: PersistenceController = {
        let result = PersistenceController(inMemory: true)
        let viewContext = result.container.viewContext
        
    }
    
    
    let container: NSPersisteneContainer
    var viewContext: NSManagedObjectContext {
        return container.viewContext
    }
}
