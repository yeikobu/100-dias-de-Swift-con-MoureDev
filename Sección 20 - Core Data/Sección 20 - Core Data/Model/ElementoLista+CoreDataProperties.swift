//
//  ElementoLista+CoreDataProperties.swift
//  Sección 20 - Core Data
//
//  Created by Jacob Aguilar on 06-03-24.
//
//

import Foundation
import CoreData


extension ElementoLista {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<ElementoLista> {
        return NSFetchRequest<ElementoLista>(entityName: "ElementoLista")
    }

    @NSManaged public var nombre: String?

}

extension ElementoLista : Identifiable {

}
