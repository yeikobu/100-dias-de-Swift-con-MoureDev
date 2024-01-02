import Foundation

//MARK: - Constantes y variables

var greeting = "Hello, playground" //greeting es una variable. Una variable puede cambiar
greeting = "Hola Jacob" //Es importante que las constantes cambien su valor en el futuro. Sino, las dejamos como constantes

let stringConstante = "Hola mundo constante" //De esta forma se declara una constante
//stringConstante = "Cambiando el mundo constante" //A una constante no se le puede volver a asignar un valor nuevamente. Es inmutable

let miNombre = "Jacob Aguilar" //Las cosas que no deben o no pueden cambiar deberían ser constantes


//MARK: - Declaraciones múltiples

let miNombreCompleto = "Jacob Aguilar Campos", miFechaDeNacimiento = "19-08-1992", lugarNacimiento = "Chile" //De esta forma se pueden hacer declaraciones múltiples (Aplica lo mismo para las variables)


//MARK: = Tipos de Datos Comunes Desde Cero
//Enteros
var x = 18

//Flotantes
//Dentro de los flotantes los Double nos trabajan en base 64 bits, mientras que los Floats en base 32 bits
var y = 18.8

//Operadores aritméticos
var sumaEnteros = x + 2 //20

var sumaFlotantes = y + 2.2 //21.0

var suma = Double(x) + y //En esta línea debemos parsear x como double, debido a que originalmente era un entero

var division = Double(x) / 2 //Si esperamos realizar divisiones es mejor parsear los numeros a flotante para no tener problemas, debido a que la división de un entero puede dar decimales


//MARK: - Asignación Implícita y Explícita
//La manera en la que fueron declaradas las variables anteriormente se llama declaración implícita debido a que en ningún momento le indicamos de que tipo de dato eran las variable, por lo que swift asumió su tipo de dato automáticamente.
//La asignación explícita es cuando nosotros le indicamos a la variable de que tipo de dato será

var xEntero: Int = 20 //Le indicamos que erá de tipo entero
var yFlotante: Double = 18.8 // Le indicamos que será de tipo Double
