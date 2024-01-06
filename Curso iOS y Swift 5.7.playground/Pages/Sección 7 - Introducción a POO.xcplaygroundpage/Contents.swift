import Foundation

//MARK: - Introducción a las estructuras, propiedades y métodos

struct Cuadrado { //Objeto
    let ancho = 10  //Propiedad del objeto cuadrado
    let alto = 10  //Propiedad del objeto cuadrado
}

//Hay que instanciar/crear una estructura
var miCuadrado = Cuadrado()
miCuadrado.ancho
miCuadrado.alto

var areaCuadrado = miCuadrado.ancho * miCuadrado.alto

//También podemos sacar el área con una función. Ejemplo:
struct Cuadrado2 { //Objeto
    let ancho = 15 //Propiedad del objeto cuadrado2
    let alto = 15 //Propiedad del objeto cuadrado2
    
    func area() -> Int { //Las funciones dentro de los objetos son llamados métodos
        return ancho * alto
    }
}

var miCuadrado2 = cuadrado2()
miCuadrado2.area() //Con esta línea podemos asignar datos directamente dentro del paréntesis.



//MARK: - Introducción a clases, instancias y uso de objetos
//Una clase es el molde de un objeto en sí. Por ejemplo para crear un automóvil en la vida real hay que tener un molde de sedan para crear más autos sedan
class Automovil {
    var color = "neutro"
    var llantas = 4
    var costo = 0
    
    func encender() -> Bool {
        return true
    }
    
    func apagar() -> Bool {
        return true
    }
    
    func acelerar() -> Bool {
        return true
    }
}

var miObjetoMazda = Automovil()

miObjetoMazda.costo
miObjetoMazda.costo = 5000
print(miObjetoMazda.costo)



//MARK: - Estructura vs Clase: Copia vs Referencia
/* 
Las estructuras y los enums son de tipo valor, es decir, cada vez que sea crea una nueva instancia de alguna de las dos, la instancia se creará en un nuevo espacio dentro de la memoria RAM. Por lo tanto, como se crea una copia nueva, si cambiamos el valor de esa copia, no afectara al objeto original.
Nota: Todos los tipos básicos: integers, floating-point numbers, Booleans, strings, arrays and dictionaries. También son de tipo valor

Las clases son de tipo referencia, es decir que, cada vez que creemos una nueva instancia de un objeto, la nueva instancia apuntará a la misma dirección de memoria RAM. Por lo tanto, si cambiamos el valor de alguna propiedad de la nueva instancia, esta modificación también afectará al objeto original.
 */


class ClaseAutomovil {
    var color = "neutro"
    var llantas = 4
    var costo = 0
    
    func encender () -> Bool {
        return true
    }
    
    func apagar() -> Bool {
        return true
    }
    
    func acelerar()->Bool {
        return true
    }
}

var miObjetoMazda = ClaseAutomovil()

miObjetoMazda.costo
miObjetoMazda.costo = 5000
print(miObjetoMazda.costo)

struct EstructuraAutomovil {
     var color = "neutro"
     var llantas = 4
     var costo = 0
    
     func encender () -> Bool {
        return true
     }
    
     func apagar() -> Bool {
        return true
     }
    
     func acelerar() -> Bool {
        return true
     }
}

var miEstructuraMazda = EstructuraAutomovil()

miEstructuraMazda.costo
miEstructuraMazda.costo = 5000
print (miEstructuraMazda.costo)

var miSegundoObjetoMazda = miObjetoMazda
var miSegundaEstructuraMazda = miEstructuraMazda
miSegundoObjetoMazda.costo = 6000
miSegundaEstructuraMazda.costo = 8100

print(miSegundoObjetoMazda.costo)
print(miSegundaEstructuraMazda.costo)


//Imprimimos para revisar si los costos originales cambiaron
print(miObjetoMazda.costo) //>En este caso se cambio el precio ya que es una clase y apuntan a la misma dirección de memoria
print(miEstructuraMazda.costo) //>En este caso no cambia el precio base, ya que las instancias de estructuras se crean en diferentes espacios de memoria y no apuntan a la misma dirección.

/*Las clases pueden heredar de otras super clases, así como los humanos pueden heredar genes de sus padres, abuelos, etc. Es decir que una clase base puede heredad de una clase padre*/

