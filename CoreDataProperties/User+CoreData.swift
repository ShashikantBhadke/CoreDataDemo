//
//  User+CoreDataProperties.swift
//  Demo
//
//  Created by Shashikant's_Macmini on 26/02/20.
//  Copyright © 2020 redbytes. All rights reserved.
//
//

import UIKit
import CoreData

@objc(User)
public class User: NSManagedObject {
    
    @nonobjc public class func fetchRequest() -> NSFetchRequest<User> {
        return NSFetchRequest<User>(entityName: "User")
    }
    
    class func fetchAll()->[User] {
        
        do {
            let result = try CoreData.context?.fetch(User.fetchRequest())
            return (result as? [User]) ?? []
            
        } catch {
            print(error.localizedDescription)
            return []
        }
    }
        
    @NSManaged public var bio: String?
    @NSManaged public var name: String?
    @NSManaged public var id: Int64
    @NSManaged public var products: NSSet?
    
}

// MARK: Generated accessors for products
extension User {
    
    @objc(addProductsObject:)
    @NSManaged public func addToProducts(_ value: Product)
    
    @objc(removeProductsObject:)
    @NSManaged public func removeFromProducts(_ value: Product)
    
    @objc(addProducts:)
    @NSManaged public func addToProducts(_ values: NSSet)
    
    @objc(removeProducts:)
    @NSManaged public func removeFromProducts(_ values: NSSet)
    
}
