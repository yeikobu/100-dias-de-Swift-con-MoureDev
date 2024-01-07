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



