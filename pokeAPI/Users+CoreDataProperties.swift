//
//  Users+CoreDataProperties.swift
//  pokeAPI
//
//  Created by MCS on 4/19/19.
//  Copyright © 2019 MCS. All rights reserved.
//
//

import Foundation
import CoreData


extension Users {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Users> {
        return NSFetchRequest<Users>(entityName: "Users")
    }

    @NSManaged public var userName: String?
    @NSManaged public var password: String?

}
