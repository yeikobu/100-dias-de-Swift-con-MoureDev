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

enum RawPersonaDataInt: Int { //En este momento cada uno de los cases es de tipo Int
    case firstName
    case lastName
    case address
    case phone
}

RawPersonaDataInt.lastName.rawValue //1, porque cuando un enum es de tipo int, todos sus valores pasan a ser númericos comienzan desde el 0


//MARK: - Range operator
var arregloEjemplo = [0,1,2,3,5,6,7,8,9]
//Two-sided range operator (Operador de rango doble)
var subSetArreglo = arregloEjemplo[1...3] //Sub set desde la posición 1 hasta la 3
var subSetArreglo2 = arregloEjemplo[1..<3] //Sub set desde la posición 1 hasta uno antes que la 3
print(subSetArreglo)

//One-sided range operator (Operador de rango único)
var subSetArreglo3 = arregloEjemplo[...3] //Sub set desde el principio hasta la tercera posición del arreglo
var subSetArreglo4 = arregloEjemplo[5...]  //Sub set desde el quinto índice hasta que termine todas las posiciones

//Podemos crear directamente un arreglo de rango cerrado
var arrayRangoCerrado = [1...3] //IMPORTANTE: Un arreglo de rango cerrado solo alamacena un valor, y ese valor es el rango. No almacena todos los valores del 1 hasta el 3
//Si queremos transformar o parsear el arreglo de rango cerrado a un arreglo normal, lo podemos hacer de la siguiente forma:
Array(arrayRangoCerrado[0]) //Creamos un arreglo indicandole que queremos la posición cero, porque el arreglo de rango cerrado solo tiene un valor, en la primera posición
var subArray = Array(arrayRangoCerrado)

var rangoCerrado = 1...3


//MARK: - Operadores desde cero
//Operador de asignación =
let numeroConstante = 18

//Operadores Aritmeticos + - * /
var numeroVariable = 2

numeroConstante + numeroVariable
numeroConstante - numeroVariable
numeroConstante * numeroVariable
numeroConstante / numeroVariable

//Operadores Compuestos
numeroVariable += 2 //Sería como resumir esto: numeroVariable = numeroVariable + 2
numeroVariable -= 2
numeroVariable *= 2
numeroVariable /= 2

//Operadores de comparación
var x = 1
var y = 1

//Igual a ==
x == y

//Diferente a !=
x != y

//Mayor que >
x > y

//Menor que <
x < y

//Mayor o igual que >=
x >= y

//Menor o igual que <=
x <= y


//MARK: - If - Else
var yearsOld = 17
var cantDinero = 1000
var sexoFemenino = false

//Si la edad es mayor o igual a 18 O la cantidad de dinero es mayor a 250 Y además eres mujer puedes entrar al bar
if yearsOld >= 18 || cantDinero > 250 && sexoFemenino {
    print ("Entras al bar, ya que eres mayor de edad, o, tienes dinero")
} else {
    print ("No entras, ya que no eres mayor de edad, o, no tienes el dinero suficiente y eres hombre")
}


//MARK: - Condiciones anidadas
//Las condiciones anidadas son cuando dentro de una condición o if, hay una o más condiciones
//Se aconseja no utilizar muchas anidaciones debido a que el código se va tornando difícil de leer
if yearsOld >= 18 {
    print ("Entras al bar, ya que eres mayor de edad")
    if cantDinero >= 250 {
        print ("Y además tienes dinero")
        if sexoFemenino {
            print ("Y también eres mujer")
        }
    }
} else {
    print ("No entras, ya que no eres mayor de edad, o, no tienes el dinero suficiente y eres hombre")
}


//MARK: - Switch
//El switch se utiliza cuando tenemos que evaluar muchos casos
let pais = "CHI"

switch pais {
case "CHI":
    print ("El idioma es español")
case "MX":
    print ("El idioma es español")
case "PE":
    print ("El idioma es español")
case "JP":
    print ("El idioma es japonés")
case "UK":
    print ("El idioma es inglés")
default:
    print ("No conozco tu idioma")
}

var age = 10

switch age {
case 0,1,2,3,4,5,6,7,8,10,11:
    print ("Eres un bebé")
case 12..<18:  //Podemos indicar que verifique desde el 12 hasta el 18 con un operador de rango
    print ("Eres un adolescente")
case 18..<79:
    print ("Ya estás mayorcito")
default:
    print ("Listo para el ataud ☦️")
}


//Switch con enum
enum PersonalData {
    case name
    case surname
    case address
    case phone
}

let userData: PersonalData = .name

switch userData {
case .name:
    print ("Aquí debería ir el nombre")
case .surname:
    print ("Aquí debería ir el apellido")
case .address:
    print ("Aquí debería ir la dirección")
case .phone:
    print ("Aquí debería ir el número de teléfono")
default:
    print ("Aquí debería arrojar error, sino se cumple ninguno")
}



//MARK: - For in
//Los ciclos for sirven para itinerar sobre una colección de datos/items y ejecutar un bloque de código por cada uno de los items de la selección de rango

var contadora = 0
for numero in 1...4 { //Iterando un rango del 1 al 4
    contadora = contadora + 1
    print (numero)
    
}

var paises = ["CHI", "MX", "JP"]

for pais in paises { //Iterando un arreglo
    print (pais)
}

var paisesDiccionario = ["CHI":"CHILE", "MX":"MÉXICO", "JP":"JAPÓN"]

for pais in paisesDiccionario { //Iterando un diccionario
    print (pais) //Al momento de imprimir esta linea, en consola nos imprimirá también el tipo de dato. Por lo tanto, si queremos imprimirlo más bonito, debemos escribirlo como en la línea que sigue.
}

var paisesDiccionarioBonito = ["CHI":"CHILE", "MX":"MÉXICO", "JP":"JAPÓN"]

for (pais,significado) in paisesDiccionarioBonito { //Iterando un diccionario con su clave y valor para cada elemento
    print ("\(pais) --> \(significado)") //Para imprimir variables dentro de una cadena de texto debemos poner \()
}

var numeros = [1, 2, 3, 4, 5, 6, 7, 8, 9]
var suma = 0

for numero in numeros { //Sumando todos los números del arreglo
    suma = numero + suma  // suma = 1+0 (1) | suma = 2+1 (3) | suma = 3+3 (6) | suma = 4+6 (10) | suma = 5 + 10 (15) | suma = 6+15 (21) ..... etc
}

print ("La suma de todos los numeros es \(suma)")



//MARK: - While
//El while se utiliza para realizar iteraciones mientras que una condición sea verdadera
while age < 18 { //OJO: la variable age está declarada en el apartado de Switch
    print ("Eres menor de edad. Te faltan \(18 - edad) años ")
    age += 1
}

print ("ya eres mayor de edad")


//MARK: - Repeat while
//A diferencia del while, repeat while siempre entra en ejecución y una vez realizada la primera iteración, se evalua si la condición sigue cumpliéndose

var numero = [1,2,3,4,5,6,7,8,9,10]
var i = numero.count - 1

repeat {
    numero.remove(at: i)
     i -= 1
    print ("cantidad elementos: \(numero.count)")
    print ("i = \(i)")
} while (numero.count > 0)

print ("El arreglo está vacío y su cantidad de elementos es: \(numero.count)")


var numeroaleatorio: Int
var n = 0
repeat {
    n += 1
    numeroaleatorio = Int(arc4random_uniform(10))
    print ("el ciclo lleva \(n) iteraciones")
    print ("El número aleatorio: \(numeroaleatorio)")
    
} while (numeroaleatorio != 8)
