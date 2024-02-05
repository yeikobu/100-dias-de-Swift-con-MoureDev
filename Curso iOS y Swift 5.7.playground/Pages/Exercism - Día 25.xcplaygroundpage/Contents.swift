import Foundation

class SpaceAge {
    // Write your code for the 'SpaceAge' exercise in this file.
    let ageInSeconds: Double
    
    init(_ ageInSeconds: Double) {
        self.ageInSeconds = ageInSeconds
    }
    
    var onEarth: Double { ageInSeconds / 31557600.0  }
    var onMercury: Double { onEarth / 0.2408467 }
    var onVenus: Double { onEarth / 0.61519726 }
    var onMars: Double { onEarth / 1.8808158 }
    var onJupiter: Double { onEarth / 11.862615 }
    var onSaturn: Double { onEarth / 29.447498 }
    var onUranus: Double { onEarth / 84.016846 }
    var onNeptune: Double { onEarth / 164.79132 }
}

let age = SpaceAge(1_000_000)
print(age.onEarth)
print(age.onMars)



//Sum of multiples

func toLimit(_ limit: Int, inMultiples: [Int]) -> Int {
  // Write your code for the 'SumOfMultiples' exercise in this method.
    var multiples: Set<Int> = [] //No item can appear twice in a set; all items must be unique
    
    inMultiples.forEach { multiple in
        for number in 1..<limit {
            if multiple != 0 && number % multiple == 0 {
                multiples.insert(number)
            }
        }
    }

    return multiples.reduce(0, +) //sum
}
