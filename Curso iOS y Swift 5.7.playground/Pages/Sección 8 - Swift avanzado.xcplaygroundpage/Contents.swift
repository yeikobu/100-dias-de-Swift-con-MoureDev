import Foundation

//MARK: - Variables optionals
//Optionals son variables que pueden o no tener valor (Puden tener un valor Nulo o Nil).
let myStringNumber = "100"
let myIntNumber = Int(myStringNumber) //Aquí el número que quedó como string en la línea anterior lo convertimos en Int. Si presionamos en la variable myStringNumber de esta línea, nos abre el menú del tipo de variable y nos indica que esta variable es de tipo nil con el símbolo "?".

let myWrongStringNumber = "Jacob"
let myIntWrongNumber = Int(myWrongStringNumber)//Nos indica que es valor nil, debido a que estamos parseando a Int un dato String

var myOptinalString: String? //Indicamos que puede ser nil con el "?"
print (myOptinalString) //Nos arroja nil, ya que en la línea anterior indicamos que la variable podía o no tener valor.


//Si siguiesemos trabajando con myOptionalString, y quisieramos ejecutar un programa coherente, tendríamos que comprobar si myOptonalString es distinto de nil, para así ejecutar, por ejemplo, un código que contenga el valor de myOptionalString.Ejemplo:

if myOptinalString != nil {
    print("Nuestra variable no es Nula")
} else {
    print("Nuestra variable es Nula")
}



//MARK: - Optional binding
//Estos los utilizaremos cuando queramos saber si es que una variable tiene un valor diferente de Nil

var myOptionalString: String?

myOptionalString = "Jacob"

if let myString0 = myOptionalString { //para crear el enlace utilizamos if let. Esto nos sirve para detectar si nuestro opcional tiene un valor no nulo. Este bloque de código solo se ejecutará cuando nuestra variable sea diferente de nil.
    print(myString0) //Nos imprime esta línea por consola, ya que indicamos que tenía el valor "Jacob"
} else {
    print(myOptionalString)
}

var myOptinalString1: String?
var myOptinalString2: String?
var myOptinalString3: String?

myOptinalString1 = "Jacob"
myOptinalString2 = "Aguilar"
myOptinalString3 = "32"

if let myString1 = myOptinalString1, let myString2 = myOptinalString2, let myString3 = myOptinalString3 {
    print("\(myString1) \(myString2) \(myString3)")
} else {
    print("Alguna de las variables es nula")
}

//Force unwraping
if myOptinalString1 != nil {
    print(myOptinalString1!) //Para usar force unwraping hay que tener claro que la variable sí o sí tiene un valor, sino, el programa arrojará un error en tiempo de ejecución
}



//MARK: - Optional chaining
class Student {
    var name: String?
    var book: Book?
}

class Book {
    var pages: Int?
}

//Las cadenas de opcionales nos sirven para acceder de forma segura a valores que están anidados.

let myStudent = Student()
print (myStudent.name)
print (myStudent.book?.pages)

myStudent.name = "Jacob"
let myBook = Book()
myBook.pages = 50
myStudent.book = myBook

//ENLACE OPCIONAL ENCADENADO
if let pages = myStudent.book?.pages, let name = myStudent.name {
    print ("El libro de \(name) tiene \(pages) páginas")
} else {
    print ("El libro no tiene páginas") //Nos arrojará que por consola este print si es que no hemos declarado los valores con anterioridad
}



//MARK: - Guard let(alternativa a if let)
//Con la sentecia guard let vamos a exigir que una condición sea verdadera para que se ejecute el código siguiente. En caso de que sea nulo, vamos a salir de esta ejecución
var myOptinalStringGuard: String?

func myFuncttion() {
    guard let myString = myOptinalStringGuard else {
        print("MyString es nulo")
        return  //Si myString es nulo se detiene el programa
    }
    
    print ("El valor de myString es \(myString)") //Guard let permite que la variable declara sea accedida fuera de su scope, a diferencia del if let
}

myFuncttion()

myOptinalStringGuard = "Ahora tenemos un valor"

myFuncttion()



//MARK: - Manejo de errores (Error handle)
/*
 Como cualquier programa informático, nuestro programa puede producir errores, lo que puede desencadenar un crush o cierre inesperado de nuestra app. Por lo tanto, como informáticos, nuestro deber es manejar la mayor cantidad de errores posibles, y en el caso de que estos errores sucedan, manejarlos de la mejor manera posible y dando la mayor información sobre ellos.
*/

func sum(firstNumber: Int?, secondNumber: Int?) throws -> Int {
    //Con la función "throws" indicamos que la función anterior es capaz de arrojar errores
    if firstNumber == nil {
        throw sumError.firstNumberNil
    } else if secondNumber == nil{
        throw sumError.secondNumberNil
    } else if firstNumber! < 0 || secondNumber! < 0 {
        throw sumError.numberNegative(firstNumber: firstNumber!, secondNumber: secondNumber!)
    }
    
    return firstNumber! + secondNumber! //Realizamos la suma una vez que se cumpla todo lo anterior
}

//DEFINICIÓN DE TIPOS DE ERRORES
//Se sugiere definir errores con "Enum"
enum sumError: Error {
    case firstNumberNil
    case secondNumberNil
    case numberNegative(firstNumber: Int, secondNumber: Int)
}

//PROPAGACIÓN DE ERRORES
do {
    print(try sum(firstNumber: nil, secondNumber: 50))
} catch sumError.firstNumberNil {
    print("El primer número es nulo")
} catch sumError.secondNumberNil {
    print("El segundo número es nulo")
} catch sumError.numberNegative(let firstNumber, let secondNumber) {
    print("Alguno de los números es negativo. firstNumber:\(firstNumber), secondNumber:\(secondNumber)")
}



//MARK: - Type casting (Validación de tipos de datos)
//Llegado el momento, puede que nosotros nos encontremos con un dato y querramos averiguar si pertenece a un tipo de dato en concreto. Para eso utilizaremos el Type Casting
let myStringName = "Jacob"
let myInt = 27

class MyClass {
    var name: String! // con el símbolo "!" obligamos a que siempre tenga el dato. No puede ser nulo
    var age: Int!
}

let myClass = MyClass()
myClass.name = "Jacob Aguilar"
myClass.age = 27

let myArray: [Any] = [myStringName, myInt, myClass] //Con el tipo de dato [Any] indicamos que el arreglo puede tener cualquier tipo de dato

for item in myArray {
    //*Type Casting para saber que tipo de dato contiene nuestro arreglo*
    if item is String {
        //*Downcasting* (Transformación de un tipo de dato a otro más restringido, ya que todos los tipos de datos en Swift, se encuentran dentro de una super clase llamada "any", por lo que este dato los transformamos a String)
        let myItemString = item as! String //Si no ponemos el símbolo "!" Xcode nos arrojará un error, debido a que tenmos que obligar a que sea de tipo string.
        print("Item es de tipo string y tiene el valor \(myItemString)")
    } else if item is Int {
        let myItemInt = item as! Int
        print("Item es de tipo int y tiene el valor \(myItemInt)")
    } else if item is MyClass {
        let myItemMyClass = item as! MyClass
        print("tem es de tipo string y tiene el valor \(myItemMyClass.name) y \(myItemMyClass.age)") //Despues de "name" o "age" podemos ponder el símbolo "!" para indicar que estos datos, como los conocemos, no son opcionales
    }
}


//Manera rápida de realizar Type y downcasting
for item in myArray {
    if let myItemString = item as? String {
        print("Item es de tipo string y tiene el valor \(myItemString)")
    } else if let myItemInt = item as? Int {
        print("Item es de tipo string y tiene el valor \(myItemInt)")
    } else if let MyItemMyClass = item as? MyClass {
        print("tem es de tipo string y tiene el valor \(MyItemMyClass.name!) y \(MyItemMyClass.age!)") //Forzamos a que no sea nulo
    }
}



//MARK: - Tipos anidados (Nested types)

/* Entendamos los tipos anidados como una forma más compleja de crear los enum. La utilidad más habitual de los enum es que nosotros los creemos en una clase para hacer comprobaciones que ya tenemos definidas como valores de un Enum. En el caso de que tengamos que crear enumeraciones para hacer comprobaciones más exhaustivas, es cuando utilizaremos los tipos anidados, que vendrán a ser agrupaciones de enum con funcionalidad muy concreta de ese tipo de enumeración  */

//Ajedrez

struct PiezaAjedrez {
    let color: Color
    let type: TipoPieza
    
    enum Color: String{
        case white = "Blanca", black = "Negra"
    }
    
    enum TipoPieza: String {
        case king = "Rey", queen = "Reina", rock = "Torre" , knight = "Caballo", bishop = "Alfil", pawn = "Peón"
        
        struct NumPiezas {
            let number: Int
        }
        
        var number: NumPiezas { //Numero de piezas por cada pieza
            switch self {
            case .king:
                return NumPiezas(number: 1)
            case .queen:
                return NumPiezas(number: 1)
            case .rock:
                return NumPiezas(number: 2)
            case .knight:
                return NumPiezas(number: 2)
            case .bishop:
                return NumPiezas(number: 2)
            case .pawn:
                return NumPiezas(number: 8)
            }
        }
    }
    
    var descrip: String {
        if type.number.number == 1 {
            return "Hay \(type.number.number) pieza de ajedrez, es de color \(color.rawValue) y de tipo \(type.rawValue)"
        }
        
        return "Hay \(type.number.number) piezas de ajedrez, es de color \(color.rawValue) y de tipo \(type.rawValue)"
    }
}

let myPiece = PiezaAjedrez(color: .black, type: .rock)
print(myPiece.descrip)



//MARK: - Extensions
/*
 Las extensiones es una característica que tiene Swift. Y nos servirá para agregar una nueva funcionalidad a una clase, a una estructura, a una enumeración o a un protocolo existente.
 
 Lo que podemos hacer con una extensión es añadir características a nivel de tipo de dato.
 
 De esta forma añadiremos una caractrística nueva y todos los datos de ese tipo pasarán a poseerla. Podemos agregar por ejemplo: La definición de propiedad de distancia, definición de funciones, nuevos inicializadores, sub índices, tipos de datos anidados o hacer que cualquier tipo se adapte a un protocolo.
*/

let myMeters: Double = 5000

func metersToKm(meters:Double) -> Double {
    return meters / 1000
}

print("\(metersToKm(meters: myMeters)) Kilómetros")

extension Double { /*En este caso agregamos una extensión a la constante myMeters. Dentro de esta extensión agregamos las propiedades  */
    var km: Double {
        return self  / 1000  /*Self siempre hace refencia al lugar donde estamos, en este caso hace referencia a que tenemos sun tipo de dato DOUBLE y que myMeters lo estamos dividiendo en mil*/
    }
    
    var m: Double {
        return self //Podemos retornar a sí mismo que en este caso es myMeters
    }
    
    var cm: Double {
        return self * 100 // Self retorna que se va a devolver a sí mismo (myMeters) * 100
    }
}

print ("\(myMeters.km) Kilómetros")
print("\(myMeters.cm) Centímetros")




//MARK: - Protocols
/*
 Un protocolo nos servirá para definir un modelo de métodos, propiedades y otros requisitos para que una clase, una estructura o una enumeración se adapten a ellos. Un protocolo va a obligar va a obligar a la clase, estructura o enumeración a que adopen una serie de propiedades y funciones a que conforme una serie de propiedades que va tener que implementar
*/


//Creación del protocolo
protocol PersonProtocol {
    var name: String { get set } //Con get indicamos que esta variable se puede obtener y con set indicamos que se puede otorgar un valor
    var age: Int { get set }
    
    func fullName() -> String
}
                
//Implementación del protocolo en estructura Programmer
struct Programmer: PersonProtocol {
    var name: String
    var age: Int
    var lenguaje: String
    
    func fullName() -> String {
           return "El nombre es: \(name), edad: \(age) y su lenguaje favorito es: \(lenguaje)"
    }
}             

//Implementación del protocolo para la estructura Teacher
struct Teacher: PersonProtocol {
    var name: String
    var age: Int
    var asignatura:String
    
    func fullName() -> String {
        return "El nombre es: \(name), edad: \(age) y y dicta la asignatura de: \(asignatura)"
    }
}

let myProgrammer = Programmer(name: "Jacob", age: 27, lenguaje: "Swift")
let myTeacher = Teacher(name: "Juan", age: 27, asignatura: "Matemática")

print (myProgrammer.fullName())
print(myTeacher.fullName())



//MARK: - Protocolo delegado
/*
 Este tipo de protocolo lo tendremos que utilizar muy habitualmente en Swift, sobre todo cuando se comience con la programación de iOS, porque es el organismo que nos permitirá comunicar dos clases en sentido inverso
*/

class FirstClass: SecondClassProtocol {
    func callSecond() {
        let secondClass = SecondClass()
        secondClass.delegate = self
        secondClass.callFirst()
    }
    
    func call() { //Método que requiere el protocolo
        print ("He vuelto")
    }
}

protocol SecondClassProtocol {
    func call()
}

class SecondClass {
    var delegate: SecondClassProtocol?
    
    func callFirst() {
        sleep(2)
        delegate?.call()
    }
}

let firstClass = FirstClass()
firstClass.callSecond()



//MARK: - Generics
/*
 Un código genérico, básicamente, nos permitirá escribir funciones y tipos flexibles que son reutilizables y que van a funcionar con diferentes tipos que se adapten a unos requisitos. De esta manera vamos a poder abstraer nuestro código y evitar la duplicación de operaciones.
*/


//Intercambio sin genéricos
func intercambioDeEnteros(a: inout Int, b: inout Int) { //En los parámetros de entrada, inout indica que esos parámetros van a entrar y salir sin que los retornemos directamente nosotros.
    let temporalA = a
    a = b
    b = temporalA
}

var myFirstInt = 5
var mySecondInt = 10
print("El primer valor es \(myFirstInt) y el segundo valor es \(mySecondInt)")
intercambioDeEnteros(a: &myFirstInt, b: &mySecondInt)
print("El primer valor es \(myFirstInt) y el segundo valor es \(mySecondInt)")//Aquí vemos como se cambiaron los valores




//Intercambio con genéricos
func intercambioDeGenericos<T>(a: inout T, b: inout T) { // Con "<T>" indicamos que pueden ingresar datos genéricos, de cualquier tipo
    let temporalA = a
       a = b
       b = temporalA
}

var myFirstGeneric = "Jacob"
var mySecondGeneric = "Aguilar"
print("El primer valor es \(myFirstGeneric) y el segundo valor es \(mySecondGeneric)")
intercambioDeGenericos(a: &myFirstGeneric, b: &mySecondGeneric)
print("El primer valor es \(myFirstGeneric) y el segundo valor es \(mySecondGeneric)")



//MARK: - Precedencia y Asocietividad
//Swift siempre hará las operaciones por precedencia de peso, divisiones y multiplicaciones primero, luego sumas y finalmente restas
//let myInt: Int = 2 + 3 % 4 * 5 // Resultado: 17 (Primero la división, luego la multiplicación y luego la suma)
let myInt: Int = (2 + ((3 % 4) * 5)) //Realizando la misma operación pero con asocietividad (nosotros le indicamos que operación hacer mediante paréntesis)
let myInt2: Int = (((2 + 3) % 4) * 5) //Resultado: 5 - Aquí le indicamos que primero haga la suma, luego la división y por último la multiplicación

//Más operadores avanzados
// - Operadores de bit a bit: Para realizar operacione con bits de tipo lógico con NOT. AND, OR, XOR
// - Operadores de desplazamiento: Para desplazar bits
// - Operadores de desbordamiento: Para manejar errores en valores por encima de su límite
// - Operadores custom: Para definir nuestros propios operadores

