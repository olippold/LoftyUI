//
//  Inventory+CoreDataProperties.swift
//  LoftyUI
//
//  Created by Oliver Lippold on 26/09/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//
//

import Foundation
import CoreData


extension Inventory {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Inventory> {
        return NSFetchRequest<Inventory>(entityName: "Inventory")
    }

    @NSManaged public var id: UUID
    @NSManaged public var image: Data?
    @NSManaged public var itemDescription: String
    @NSManaged public var itemName: String

}

extension Inventory : Identifiable {
    static var example: Inventory {
        var item = Inventory()
        item.itemName = "Example Item"
        item.itemDescription = "A description of my example"
        return item
        
    }
}
