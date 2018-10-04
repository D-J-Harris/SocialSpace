//
//  CoreDataHelper.swift
//  SocialSpace
//
//  Created by Daniel Harris on 03/10/2018.
//  Copyright © 2018 Daniel Harris. All rights reserved.
//


import Foundation
import CoreData
import UIKit

struct CoreDataHelper {
    
    static let context: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    var users: [NSManagedObject] = []
    
    
    static func newUser(_ username: String) {
        let user = NSEntityDescription.insertNewObject(forEntityName: "User", into: context) as! User
        
        user.username = username
        user.locationValue = 1
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    
    
    static func retrieveUser() -> User? {
        do {
            let fetchRequest = NSFetchRequest<User>(entityName: "User")
            let results = try context.fetch(fetchRequest)
            return results[0]
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return nil
        }
    }
    
    
    static func updateUserLocationValue(_ locationValue: Double) {
        
        if let user: User = retrieveUser() {
            user.locationValue = locationValue
        }
        
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
}

