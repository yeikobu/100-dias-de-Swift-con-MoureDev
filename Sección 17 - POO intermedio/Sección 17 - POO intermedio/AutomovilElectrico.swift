//
//  AutomovilElectrico.swift
//  Sección 17 - POO intermedio
//
//  Created by Jacob Aguilar on 20-02-24.
//

import Foundation

class AutomovilElectrico: Automovil {
    var porcentajeBateria = 100
    
    func cargarBateria() -> String {
        porcentajeBateria = 100
        return "Carga exitosa"
    }
    
    
}
