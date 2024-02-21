//
//  ViewController.swift
//  Seccion 18 - Ciclo de vida de la App y del ViewController
//
//  Created by Jacob Aguilar on 21-02-24.
//

import UIKit

class ViewController: UIViewController {
    
    //Esta función es la primera que se carga en memoria. Incluso antes de desaparecer e ir a otra pantalla, se carga el método viewDidLoad del siguiente view controller primero, y luego termina de morir el view controller
    override func viewDidLoad() { //override sirve para sobre escribir métodos de la clase padre. En este caso sobreescribimos viewDidLoad que contiene la clase padre (UIViewController)
        super.viewDidLoad() //super hace referencia a la clase padre. En esta línea se manda a llamar al método que contiene la clase padre. Es buena práctica mandar a llamar a los métodos de los padres siempre y cuando no retornen un valor
        
        /* viewDidLoad es llamado solo cuando la vista es creada. Aquí es un buen momento para hacer cambios en UI ya que la vista ha sido cargada en memoria y tiene acceso a todod sus elementos y conexiones. Al ser un método que solo se manda a llamar una vez en un buen lugar para hacer cosas que solo se necesitan hacer una vez. Por ejemplo iniciar la base de datos o conexiones a servidores*/
        
        print("Estoy en el view controller y estoy activo en la función: \(#function)") //#function sirve para saber en qué función se encuentra algo
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        /* viewWillAppear siempre se llama antes de que la vista del viewController se muestre en pantalla. Buen lugar para código que se requere llamar cada vez que la vista se va a mostrar en pantalla, a ser potencialmente llamado tantas veces aquí, no se recomieda escribir código que se requiere ejecutar una sola vez. Por ejemplo, actualizar elementos de UI que han cambiado cuando el usuario se encontraba en otra vista */
        
        print("Estoy en el view controller y estoy activo en la función: \(#function)")
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*Este metodo es llamado cuando la vista ya se desplego en pantalla. Al ya estar seguro que dicha vista ya esta en pantalla es buen lugar para iniciar procesos que pueden ser pesados para el CPU y por lo tanto podrian ocasionar problemas al mostrar elementos de tu vista. Ejemplos: Iniciar musica, sonidos, video, animaciones o recolectar datos de un servidor */
        
        print("Estoy en el view controller y estoy activo en la función: \(#function)")
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        /*Este metodo es llamado antes de que la vista sea removida de la pantalla. Su uso no es muy común pero puedes usarla para iniciar limpieza o verificaciones */
        
        print("Estoy en el view controller y estoy activo en la función: \(#function)")
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
        /*Este metodo se llama cuando la vista se removida de pantalla. Buen lugar para detener procesos que no se requieran cuando el usuario no ve esa pantalla que fue removida. Ejemplo: Detener musica, llamadas a servidores o a dispositivos externos ligados a esa vista */
        
        print("Estoy en el view controller y estoy activo en la función: \(#function)")
    }
}

