import Foundation

//MARK: - Tipo de dato String

let myString = "Bienvenidos al curso de Swift" //De esta forma se declara un String en una linea. Swift infiere automaticamente que es un tipo de dato String cuando detecta las comillas

//De esta forma se declaran los strings de varias líneas
let myMultipleString = """
Bienvenidos al curso de Swift

Espero que os parezcan interesantes los Strings
"""

//String de varias líneas en código o falso. Con las \ elimina los espacios entre líneas
let myFalseMultipleString = """
Bienvenidos al curso de Swift\
\
Espero que os parezcan interesantes los Strings
"""

//String vacío
let myEmptyString = ""
let myEmptyString2 = String() //Otra forma de inicializar un string vacío


//MARK: - Tipos de dato Character, Unicode y Emojis
let myCharacter = "\u{E9}" //De esta forma podemos representar un caracter unicode
let myCharacter2 = "\u{24}"

//Caracteres especiales: \n, \r, \t \0, \'...
let myStringConSalto = "Bienvenidos al\n curso de Swift" //\n nos permite agrefar un salto de línea

//Emojis
let myEmoji = "\u{1F496}" //Podemos escribir los emojis de esta forma o agregando el emoji directamente
let myEmoji2 = "🤭"


//MARK: - Concatenación e interpolación de Strings

//Concatenación (Unir varias cadenas de texto)
var myWelcomeString = "Bienvenidos" + " " + "al curso de Swift"
myWelcomeString += "\nQué tal va la clase?"

//Interpolación (Es una concatenación, pero agregando otras variables)
let name = "Jacob Aguilar"
let country = "Chile"
let myPersonlInfo = "Mi nombre es \(name) y vivo en \(country)" //Dentro de este string agregamos varias variables


//MARK: - Comparación y otras operaciones

//Comparación
let name1 = "Brais"
let name2 = "Juan"
let name3 = "Brais"
let name4 = "Jacob"

//No son iguales
name1 == name2

//Son iguales
name1 == name3

//Operación de contenido
let myContent = "Mi nombre es Jacob"
myContent.contains(name4) //De esta forma podemos verificar si una cadena de texto contiene otra cadena de texto

//Vacía
let myEmptyString = ""
myEmptyString == "" //Primera forma para comprobar si una cadena de texto es vacía
myEmptyString.isEmpty //Segunda forma para comprobar si una cadena de texto es vacía

//Recorrido
for valor in myContent { //De esta forma podemos acceder a cada caracter de una cadena de texto 
    print(valor)
}
