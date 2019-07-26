//
//  DataController.swift
//  Mooskine
//
//  Created by vikas on 24/07/19.
//  Copyright © 2019 Udacity. All rights reserved.
//

import Foundation
import CoreData

class DataController{
    let persistentContainer:NSPersistentContainer
    
    var viewContext:NSManagedObjectContext{
        return persistentContainer.viewContext
    }
    var backgroundContext:NSManagedObjectContext!
    init(modelName:String){
        persistentContainer = NSPersistentContainer(name: modelName)
       
    }
    
    func configureContexts(){
        backgroundContext = persistentContainer.newBackgroundContext()
        viewContext.automaticallyMergesChangesFromParent = true
        backgroundContext.automaticallyMergesChangesFromParent = true
        backgroundContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump
        viewContext.mergePolicy = NSMergePolicy.mergeByPropertyStoreTrump 
    }
    
    func load(completion: (()-> Void)? = nil){
        persistentContainer.loadPersistentStores{ storeDescription, error in
            guard error == nil else{
                fatalError(error!.localizedDescription)
            }
            self.autoSaveViewContext(interval: 3)
            completion?()
        }
    }
}
extension DataController{
    func autoSaveViewContext(interval:TimeInterval = 30){
        print("autosaving")
        guard interval > 0 else {
            print("can not set negative autosave interval")
            return
        }
        if viewContext.hasChanges{
            try? viewContext.save()
        }
            DispatchQueue.main.asyncAfter(deadline: .now() + interval){
                self.autoSaveViewContext(interval: interval)
            }
    }
}
