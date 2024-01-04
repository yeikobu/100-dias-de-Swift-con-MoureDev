import Foundation

//MARK: - Booleanos y valores lógicos
var estidiosJacobAguilar = "Universitario"
var cedulaProfesional = true
var cedulaMaster = false
var salario = 0

if cedulaProfesional {
    salario = 2000
} else {
    salario = 700
}

salario


//MARK: - Colecciones desde cero
//Una colección nos sirve para almacenar un conjunto de valores y después poder trabajar con ellos
//En Swif tenemos 3 tipos: Arrays o Arreglos, Sets y Dictionarys

//MARK: - Arreglos
var arregloNumeros = [1, 2, 3] //Arreglo de numeros enteros
let arregloNumerosInmutables = [3, 2, 1] //Es un arreglo inmutable, porque es constante

print(arregloNumeros[1]) //Los indices de las colecciones comienzan en 0, por lo que si queremos obtener el valor de la segunda posición de "arregloNumeros" debemos indicar que queremos el valor del indice 1, y si queremos el valor de la primera posición, debemos poner el cero [0]
print(arregloNumerosInmutables[0])

//El método append nos permite agregar un valor al final del arreglo
arregloNumeros.append(5)
print(arregloNumeros) //[1, 2, 3, 5]

//El método insert nos permite agregar un valor en la posición que deseemos
arregloNumeros.insert(4, at: 3) //
print(arregloNumeros) //[1, 2, 3, 4]

//El método removeLast nos permite eliminar el valor de la última posición
arregloNumeros.removeLast()
print(arregloNumeros)

//El método remove(at: ) nos permite eliminar un valor de una posición específica
arregloNumeros.remove(at: 3)
print(arregloNumeros)

//El método removeAll nos permite eliminar todos los elementos de un arreglo
arregloNumeros.removeAll()
print(arregloNumeros)


var arregloVacio: [Int] = [] //Crear una arreglo vacío de enteros
print(arregloVacio)



//MARK: - Diccionarios
// En los diccionarios, a diferencia de los arrays, los elementos no se guardan de manera ordernada, debido a que debemos buscar por su clave
let myClassicDictionary = Dictionary<Int, String>() //Manera clásica en la que se declaraba un diccionario
var myModernDictionary = [Int: String]() //Forma actual de declarar un diccionario

//Agregar datos
myModernDictionary = [001 : "Juan", 002 : "Brais"]

//Agregar solo un dato
myModernDictionary[003] = "Jacob" //Si queremos agreagar nuevos datos siempre debemos hacerlo de esta forma, ya que si hacemos esto: "myModernDictionaty = [001 : "Jacob"]" el diccionario se sobreescribirá
myModernDictionary[004] = "Pedro"
myModernDictionary[005] = "Juan"


//Acceso a un dato
myModernDictionary[002]

//La clave del diccionario es única, por lo que si modificamos el valor asociado a una clave, será sobreescrito
myModernDictionary[002] = "Brais Moure" //Aquí se sobre escribe el valor asociado a la clave 002
myModernDictionary.updateValue("Brais Moure", forKey: 002) //Opción clásica( antigua) para actualizar un valor

//Borrar datos
myModernDictionary[002] = nil //De esta forma le indicamos que el valor asociado a 002 es nulo, y por lo tanto, no existe
myModernDictionary.removeValue(forKey: 002) //Opción clásica para remover un valor



//MARK: - Tuplas
//Las tulas nos permiten trabajar con diferentes tipos de datos
var persona = ("Jacob", "Aguilar", 31, 1.70)

//Al igual que en los arrays, el 0 es la primera posición
persona.0

//Asignando los valores de una tupla a diferentes variables
var (nombre, apellido, edad, estatura) = persona

nombre

//Tupla nombrada
//En las tuplas  nombradas podemos nombrar cada valor de la tupla, para poder acceder a cada valor por su nombre en vez del índice
var personaNamedTuples = (nombre: "Jacob", apellido: "Aguilar", edad: 31, estatura: 1.70)
personaNamedTuples.nombre



//MARK: - Enumeraciones
//Una enumeracion es una estructura que nos permite trabajar con datos que tienen cosas en común para luego poder usarlos de una forma muy segura

enum PersonaData {
    case firstName
    case lastName
    case address
    case phone
}

var currentData: PersonaData = .firstName
var input = "Jacob"

currentData = .phone
input = "62763723"

//Enumeraciones con valores asociados
enum ComplexPersonaData {
    case firstName(String)
    case lastName(String)
    case address(String, Int)
    case phone(Int)
}


var complexCurrentData: ComplexPersonaData = .firstName("Jacob")
complexCurrentData = .address("Calle falsa", 23)


//Enumeracions con el mismo tipo de valor
enum RawPersonaData: String { //En este momento cada uno de los case es de tipo string
    case firstName
    case lastName
    case address
    case phone
}

RawPersonaData.lastName.rawValue //Con rawValue accedemos a su valor en bruto

enum RawPersonaDataString: String { //En este momento cada uno de los case es de tipo string
    case firstName = "Nombre"
    case lastName = "Apellido"
    case address = "Dirección"
    case phone = "Teléfono"
}

RawPersonaDataString.firstName.rawValue //nombre

enum RawPersonaDataInt: Int { //En este momento cada uno de los case es de tipo Int
    case firstName
    case lastName
    case address
    case phone
}

RawPersonaDataInt.lastName.rawValue //1, porque cuando un enum es de tipo int, todos sus valores pasan a ser númericos comienzan desde el 0
