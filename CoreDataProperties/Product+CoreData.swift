//
//  Product+CoreDataProperties.swift
//  Demo
//
//  Created by Shashikant's_Macmini on 26/02/20.
//  Copyright © 2020 redbytes. All rights reserved.
//
//

import Foundation
import CoreData

@objc(Product)
public class Product: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }
    
    class func fetchAll()->[Product] {
        
        do {
            let result = try CoreData.context?.fetch(Product.fetchRequest())
            return (result as? [Product]) ?? []
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    class func fetchAll(user: User)->[Product] {
        let request = NSFetchRequest<Product>(entityName: "Product")
        request.predicate = NSPredicate(format: "user == %@ || user == NULL", user)
        
        do {
            let result = try CoreData.context?.fetch(request)
            return (result ?? [])
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    class func fetch(user: User)->[Product] {
        let request = NSFetchRequest<Product>(entityName: "Product")
        request.predicate = NSPredicate(format: "user == %@", user)
        
        do {
            let result = try CoreData.context?.fetch(request)
            return (result ?? [])
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
    
    @NSManaged public var id: Int64
    @NSManaged public var name: String?
    @NSManaged public var price: String?
    @NSManaged public var user: User?
    
}
