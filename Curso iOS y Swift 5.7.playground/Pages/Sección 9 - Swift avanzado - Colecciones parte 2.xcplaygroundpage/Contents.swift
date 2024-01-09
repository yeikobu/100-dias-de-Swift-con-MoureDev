import Foundation


//MARK: - Sets (Conjuntos)
/*
 Los sets son una mezcla entre los arrays y los dictionarys. Los sets no estarán ordenados y no podrán repetir valores. Eso sí, tendrán que pertenecer a un tipo concreto de datos.
*/

//Conjuntos
var mySet = Set<String>()
let mySet2: Set<String> = ["Jacob","Aguilar","27","Jacob"] //De esta forma los podemos inicializar los valores de inmediato
let mySet3: Set = ["Jacob","Aguilar","27","Jacob"] //Si no indicamos el tipo de dato, toma el que tengan los valores dentro

//inserción de uno en uno
mySet.insert("Jacob")
mySet.insert("Aguilar")
mySet.insert("27")
mySet.insert("Jacob") //Hasta aquí insertamos los mismos valores a mySet que mySet2.

print(mySet) //Solo nos muestra 3 valores por pantalla, porque los set no muestran valores repetidos.

//Acceso
if mySet.contains("Aguilar") { //Si mySet contiene "Aguilar"...
    print("Existe")
} else {
    print("No existe")
}

//Modificación.
mySet.remove("27")
print(mySet)


//Acceso y modificación por índice.
if let index = mySet.firstIndex(of: "Jacob") {
    mySet.remove(at: index)
}
print(mySet)

mySet.insert("Jacob")
mySet.insert("Aguilar")
mySet.insert("27")
mySet.insert("Bienvenidos al mundo")

//Iteración de un set
for myElement in mySet {
    print(myElement)
}


/*Operaciones de conjuntos*/
let myIntSet: Set = [1,2,3,4,5]
let myIntSet2: Set = [0,2,3,6,7]


//Intersección en los conjuntos
print(myIntSet.intersection(myIntSet2))

//Diferencia simétrica de conjuntos
print(myIntSet.symmetricDifference(myIntSet2))

//Unión entre conjuntos
print(myIntSet2.union(myIntSet2))

//Sustracción entre conjuntos
print(myIntSet.subtracting(myIntSet2))




//MARK: - Sort (Algortimos de colecciones)
/***Las colecciones de tipo dictionary y de tipo Set no se pueden ordenar con sort.****/
var myArray = [5,8,1,0,3,9,7,2,4,6]

var myDictionary = [5:"Cinco",8:"ocho",1:"uno",0:"cero",3:"tres",9:"nueve",7:"siete",2:"dos",4:"cuatro",6:"seis"]

var mySetNums: Set = [5,8,1,0,3,9,7,2,4,6]

/* Sort (Ordenación)*/

print(myArray)
myArray.sort() //Si utilizamos sort, el conjunto que mandemos a llamar tiene que ser var, debido a que cambiará el orden
print(myArray)

myArray.sort { (intA, intB) -> Bool in
    return intA > intB
}

print(myArray)




//MARK: - Sorted

/*La principal diferencia que existe entre sort y sorted, es que la primera ordena la colección que estamos ejecutando. Por lo contrario, lo que hace sorted es que deja sin modificar la colección que estabamos ordenando y nos retornará una nueva ya ordenada*/


print(myArray) //Imprime por pantalla array original
var myArraySorted = myArray.sorted()//Ordenamos el arreglo en una variable
print(myArray)//Sigue imprimiendo por pantalla array original
print(myArraySorted)//Imprime el arreglo ya ordenado, el cual se encuentra guardo en myArraySorted


myArraySorted = myArray.sorted{(intA, intB) -> Bool in //Ordenado de manera "custom" del 9 hasta el 0
    return intA > intB
}

print(myArraySorted)

let mySortedDictionary = myDictionary.sorted { (elementA, elementB) -> Bool in //Ordenado y cambiado a tupla (Dictionary no se                                                                            puede ordenar)
    return elementA < elementB
}

print(mySortedDictionary)

var mySortedSet = mySetNums.sorted()
print(mySetNums)

mySortedSet = mySetNums.sorted { (intA, intB) -> Bool in
    return intA > intB
}

print(mySortedSet)




//MARK: - Map
//Map nos ayuda a transformar colecciones a una colección de otro tipo de dato
let myMapArray = myArray.map { (myInt) -> Int in
    return myInt + 10
}

print(myArray)

let myStringMapArray = myArray.map { (myString) -> String in
    return "Este es el número \(myString)"
}

print(myStringMapArray)

let myIntMapArray = myDictionary.map { (myElement) -> Int in
    return myElement.key
}

print(myIntMapArray)

let myStringMapArray2 = mySetNums.map { (myInt) -> String in
    return "\(myInt)"
}

print(myStringMapArray2)




//MARK: - ForEach
myArray.forEach { (myInt) in
    print (myInt)
}

print ("") //Espacio para ver cuando se ejecuta una función y la otra

myDictionary.forEach { (myElement) in
    print (myElement.key)
}

print ("") //Espacio para ver cuando se ejecuta una función y la otra

mySetNums.forEach { (myInt) in
    print(myInt)
}




//MARK: - Otras colecciones

// - Count: Cuenta cuantos elementos hay dentro del arreglo

print(myArray.count)
print(myDictionary.count)
print(mySetNums.count)

// - sEmpty: Comprueba si nuestra colección está vacía
print(myArray.isEmpty)
print(myDictionary.isEmpty)
print(mySetNums.isEmpty)


// - eversed: Invierte el orden de nuestra colección

print(myArray.reversed()as [Int])
print(myDictionary.reversed())
print(mySetNums.reversed())

// - irst o last
print(myArray.first)
print(myDictionary.first)
print(mySetNums.first)
print(myArray.last)
print(myDictionary.last)
print(mySetNums.last)
print(myArray.popLast())
print(myDictionary.popFirst())
print(mySetNums.popFirst())
