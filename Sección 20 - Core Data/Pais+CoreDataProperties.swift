//
//  Pais+CoreDataProperties.swift
//  Sección 20 - Core Data
//
//  Created by Jacob Aguilar on 07-03-24.
//
//

import Foundation
import CoreData


extension Pais {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Pais> {
        return NSFetchRequest<Pais>(entityName: "Pais")
    }

    @NSManaged public var nombre: String?

}

extension Pais : Identifiable {

}
