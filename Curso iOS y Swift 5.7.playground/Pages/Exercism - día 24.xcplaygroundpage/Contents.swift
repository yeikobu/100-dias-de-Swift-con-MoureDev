//: [Previous](@previous)

import Foundation

func toRna(_ dna: String) -> String {
    // Write your code for the 'Rna Transcription' exercise in this file.
    var rna = ""
    dna.forEach { nucleotide in
        switch nucleotide {
        case "G":
            rna.append("C")
        case "C":
            rna.append("G")
        case "T":
            rna.append("A")
        case "A":
            rna.append("U")
        default:
            print("Invalid nucleotide founded!")
        }
    }
    
    return rna
}

toRna("GCTA")
