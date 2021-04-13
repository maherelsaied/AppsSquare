//
//  CoreDataManger.swift
//  EventApp
//
//  Created by Maher on 12/20/20.
//

import UIKit
import CoreData

final class CoreDataManger {
    lazy var persistentContainer : NSPersistentContainer = {
        let persistentContainer = NSPersistentContainer(name: "Favorite")
        persistentContainer.loadPersistentStores { (_, error) in
            print(error?.localizedDescription ?? "")
        }
        return persistentContainer
    }()
    var moc : NSManagedObjectContext {
        persistentContainer.viewContext
    }
  
    
    func saveEvent (data : MenuItem) {
        let event = Favorite(context: moc)
        event.setValue(data.name, forKey: "name")
        event.setValue(data.id, forKey: "id")
        event.setValue(data.photoCredit, forKey: "photoCredit")
        event.setValue(data.price, forKey: "price")
        event.setValue(1, forKey: "numOfOrder")
        event.setValue(data.restrictions, forKey: "restrictions")
        event.setValue(data.description, forKey: "description1")
        event.setValue(data.mainImage, forKey: "mainImage")
        event.setValue(data.thumbnailImage, forKey: "thumbnailImage")
        do {
            try moc.save()
        }catch {
            print(error)
        }
        
    }
    
    
    func saveFav (data : Favorite) {
        let event = Favorite(context: moc)
        event.setValue(data.name, forKey: "name")
        event.setValue(data.id, forKey: "id")
        event.setValue(data.photoCredit, forKey: "photoCredit")
        event.setValue(data.price, forKey: "price")
        event.setValue(1, forKey: "numOfOrder")
        event.setValue(data.restrictions, forKey: "restrictions")
        event.setValue(data.description, forKey: "description1")
        event.setValue(data.mainImage, forKey: "mainImage")
        event.setValue(data.thumbnailImage, forKey: "thumbnailImage")
        do {
            try moc.save()
        }catch {
            print(error)
        }
        
    }
    
    func fetchEvents () ->[Favorite] {
        do {
        let fetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
        let events = try moc.fetch(fetchRequest)
            return events
        }catch{
            print(error.localizedDescription)
            return []
        }
    }
    
    func removeFav(object : Favorite){
        
        let fetchRequest = NSFetchRequest<Favorite>(entityName: "Favorite")
        do {
            moc.delete(object)
            try moc.save()
        } catch _ {
            // error handling
            print("error")
        }
    }
        
}
