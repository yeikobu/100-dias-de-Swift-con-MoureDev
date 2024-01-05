import Foundation

//MARK: - Funciones
//Las funciones son un bloque de código que se puede llamar dentro del programa en cualquier momento para realizar una función especifíca.

/*
 var numeroAleatorio:Int
 numeroAleatorio = Int (arc4random_uniform(100))
 */

print ("Hola Mundito")  //La función print es una función pre hecha para facilitar enviar mensajes por consola.

//Creación de una función sin parámetro
func holaMundo() {
    print ("Hola Mundo")
}

holaMundo() //Aquí llamamos a la función holaMundo, la cual emprime por pantalla "Hola munfo"

func sumaNumerosCualquiera(){
    var numero = 2+2
}

sumaNumerosCualquiera()



//MARK: - Funciones de un solo parámetro

func cuadradoDe(numero: Int) { //En este caso la función recibe un parámetro de tipo entero
    let numeroAlCuadrado = numero * numero
    print (numeroAlCuadrado)
}

cuadradoDe(numero: 10) //Aquí le asignamos el valor entero que la función requiere para ser ejecutada



//MARK: - Funciones con múltiples parámetros y valor de retorno

//Función con valor de retorno
//Una función con retorno, nos devuelve un valor el cual podemos usar cuando mandamos a llamar a la función
func cuboDe(numero: Int) -> Int { //Con el símbolo "->" indicamos que retornaremos un valor del tipo que nosotros deseemos
    let numeroAlCubo = numero * numero * numero
    return numeroAlCubo //Si la función es con retorno, debemos indicarle el valor a devolver con la palabra reservada "return"
}

let resultado = cuboDe(numero: 10) //Llamamos a la funcion "cuboDe" y le pasamos el valor de 10. El resultado de la función se guarda en "resultado"
print (resultado)
/* 
 NOTA: Quizás no siempre vamos a querer guardar el valor de retorno en una constante o variable. En ese caso, solo tendríamos que mandar a llamar a la función con "_ =". Con eso le decimos al compilador que si queremos llamar a la función, pero no queremos hacer nada con el valor
Ejemplo:
_ = cuboDe(numero:10)
 */


//Función con múltiples parámentros
func saludarAlmuno (nombre: String, mensaje: String) {
    print("Hola \(nombre). \(mensaje)")
}

saludarAlmuno(nombre: "Jacob", mensaje: "Bienvenido al curso")



//MARK: - Definir valores por default
func saludarAlumno(nombre: String, mensaje: String = ". ¿Cómo estás?") {
    print("Hola \(nombre)\(mensaje)")
}

saludarAlumno(nombre: "Jacob")
saludarAlumno(nombre: "Jacob", mensaje: ". Recuerda estudiar") //En esta línea sobrescribimos el mensaje



//MARK: Valores múltiples de retorno en una función
func listanombres () -> [String] { //Le indicamos que retornará un arreglo
    let arregloNombres = ["José", "Jacob", "María"]
    return arregloNombres
}

let nombres = listanombres()
print (nombres)
nombres //Si vamos a devolver o trabajar con diferentes tipos de datos (Flotantes, enteros, strings, etc) se recomienda utilizar tuplas



//MARK: - Añadir nombre a parámetros externos
//Parámetros internos (Nombre interno de los parámetros): Son los nombres de los parámetros que usamos dentro de la función
func notasPromedio(nota1: Double, nota2: Double, nota3: Double) -> Double {
    return (nota1 + nota2 + nota3) / 3
}

let notasPromedioFinal = notasPromedio(nota1: 65, nota2: 55, nota3: 62)
print ("Tu promedio de notas final es: \(notasPromedioFinal)")


//Parámetros externos
//Le damos un nombre a cada uno de los parámetros para que luego sean usados al momento de llamar a la función
func notasPromedioMaterias(matematicas nota1: Double, quimica nota2: Double, fisica nota3: Double) -> Double{
//Se dice que es un valor externo, porque se asigna otro parámetro el cual sea más fácil de leer para terceros
    return (nota1 + nota2 + nota3) / 3
}

let notasPromedioFinal2 = notasPromedioMaterias(matematicas: 62, quimica: 65, fisica: 69)
print ("Tu promedio de notas final es: \(notasPromedioFinal2)")



//MARK: - Introducción a los closures
//Un Closure es un bloque de código o función que puede ser (o no) almacenada en una variable o constante

/* SINTAXIS DE CLOSURES
 
 {(Parametros) -> tipo-valor-retorno in
  codigo
 }
 
 */

let miPrimerClosure = {(materia1: Double, materia2: Double, materia3: Double) -> Double in //Importante: Los closures no pueden tener valores de parámetros externos como en las funciones
    return (materia1 + materia2 + materia3) / 3
}

miPrimerClosure(100, 22, 88) //De esta manera podemos tener una variable o constante que podemos pasar a cualquier lugar a lo largo del código como imprimirlo dentro de la función print

print ("Mi promedio fue de: \(miPrimerClosure(100, 22, 88))")
