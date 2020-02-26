//
//  CoreData.swift
//  Demo
//
//  Created by Shashikant's_Macmini on 26/02/20.
//  Copyright © 2020 redbytes. All rights reserved.
//

import UIKit
import CoreData


final class CoreData {
    
    static let context = {
        return (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext
    }()
    
} //class
