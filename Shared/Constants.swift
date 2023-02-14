//
//  Constants.swift
//  Rhymd
//
//  Created by Fery Lancz on 29.10.22.
//

import Foundation
import SwiftUI

struct Constants {
    
    struct UI {
        static let logoText = "RHYMD"
        static let logoIconName = "text.quote"
    }
    
    
    
    struct GermanDictionary {
        static let filename = "german"
        static let fileExtension = "dic"
    }
    
    struct Coder {
        
        // MARK: - Vocal Codes
        /*
         0: a, kurz
         1: a, lang
         2: ai
         3: au
         4: e, allgemein
         5: e, lang gesprochenes é
         6: e, kurz gesprochen
         7: ei
         8: eu
         9: er, am Ende eines Wortes welches auch als a gesprochen werden kann
         10: ey
         11: i, kurz
         12: i, lang
         13: o, kurz
         14: o, lang
         15: oi
         16: u, kurz
         17: u, lang
         18: ö
         19: ü
         */
        
        static let recognitionElements = [
            RecognitionElement(chars: "aa", vocalCodes: [1], condition: .everywhere),
            RecognitionElement(chars: "ah", vocalCodes: [1], condition: .everywhere),
            RecognitionElement(chars: "ai", vocalCodes: [2], condition: .everywhere),
            RecognitionElement(chars: "uy", vocalCodes: [2], condition: .everywhere),
            RecognitionElement(chars: "au", vocalCodes: [3], condition: .everywhere),
            RecognitionElement(chars: "eh", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "aktie", vocalCodes: [0, 11, 6], condition: .everywhere),
            RecognitionElement(chars: "beere", vocalCodes: [5, 6], condition: .everywhere),
            RecognitionElement(chars: "beet", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "fee", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "heer", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "klee", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "leer", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "meer", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "schnee", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "seele", vocalCodes: [5, 6], condition: .everywhere),
            RecognitionElement(chars: "see", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "speer", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "teer", vocalCodes: [5], condition: .everywhere),
            RecognitionElement(chars: "ea", vocalCodes: [6, 0], condition: .everywhere),
            RecognitionElement(chars: "eo", vocalCodes: [6, 13], condition: .everywhere),
            RecognitionElement(chars: "er", vocalCodes: [9], condition: .last),
            RecognitionElement(chars: "er", vocalCodes: [6], condition: .everywhere),
            RecognitionElement(chars: "en", vocalCodes: [6], condition: .everywhere),
            RecognitionElement(chars: "el", vocalCodes: [6], condition: .everywhere),
            RecognitionElement(chars: "emp", vocalCodes: [6], condition: .everywhere),
            RecognitionElement(chars: "e", vocalCodes: [6], condition: .last),
            RecognitionElement(chars: "en", vocalCodes: [6], condition: .last),
            RecognitionElement(chars: "el", vocalCodes: [6], condition: .last),
            RecognitionElement(chars: "ei", vocalCodes: [7], condition: .everywhere),
            RecognitionElement(chars: "eu", vocalCodes: [8], condition: .everywhere),
            RecognitionElement(chars: "äu", vocalCodes: [8], condition: .everywhere),
            RecognitionElement(chars: "ey", vocalCodes: [10], condition: .everywhere),
            RecognitionElement(chars: "ay", vocalCodes: [10], condition: .everywhere),
            RecognitionElement(chars: "ie", vocalCodes: [12], condition: .everywhere),
            RecognitionElement(chars: "ih", vocalCodes: [12], condition: .everywhere),
            RecognitionElement(chars: "ee", vocalCodes: [12], condition: .everywhere),
            RecognitionElement(chars: "e", vocalCodes: [6], condition: .doubleAfter),
            RecognitionElement(chars: "oh", vocalCodes: [14], condition: .everywhere),
            RecognitionElement(chars: "boot", vocalCodes: [14], condition: .everywhere),
            RecognitionElement(chars: "doof", vocalCodes: [14], condition: .everywhere),
            RecognitionElement(chars: "koog", vocalCodes: [14], condition: .everywhere),
            RecognitionElement(chars: "moor", vocalCodes: [14], condition: .everywhere),
            RecognitionElement(chars: "moos", vocalCodes: [14], condition: .everywhere),
            RecognitionElement(chars: "zoo", vocalCodes: [14], condition: .everywhere),
            RecognitionElement(chars: "oi", vocalCodes: [15], condition: .everywhere),
            RecognitionElement(chars: "uh", vocalCodes: [17], condition: .everywhere),
            RecognitionElement(chars: "oo", vocalCodes: [17], condition: .everywhere),
            RecognitionElement(chars: "a", vocalCodes: [0], condition: .everywhere),
            RecognitionElement(chars: "e", vocalCodes: [4], condition: .everywhere),
            RecognitionElement(chars: "i", vocalCodes: [11], condition: .everywhere),
            RecognitionElement(chars: "o", vocalCodes: [13], condition: .everywhere),
            RecognitionElement(chars: "u", vocalCodes: [16], condition: .everywhere),
            RecognitionElement(chars: "y", vocalCodes: [11], condition: .everywhere),
            RecognitionElement(chars: "ö", vocalCodes: [18], condition: .everywhere),
            RecognitionElement(chars: "ü", vocalCodes: [19], condition: .everywhere),
            RecognitionElement(chars: "ä", vocalCodes: [5], condition: .everywhere)
        ]
        
        static let comparisonTable: [[Double]] = [
             //0   //1   //2   //3   //4   //5   //6   //7   //8   //9   //10  //11  //12  //13  //14  //15  //16  //17  //18  //19
            [1.00, 0.90, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],   //0
            [0.90, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],   //1
            [0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.80, 0.80, 0.00, 0.95, 0.00, 0.00, 0.00, 0.00, 0.80, 0.00, 0.00, 0.00, 0.00],   //2
            [0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],   //3
            [0.00, 0.00, 0.00, 0.00, 1.00, 0.85, 0.85, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],   //4
            [0.00, 0.00, 0.00, 0.00, 0.85, 1.00, 0.50, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],   //5
            [0.00, 0.00, 0.00, 0.00, 0.85, 0.50, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],   //6
            [0.00, 0.00, 0.80, 0.00, 0.00, 0.00, 0.00, 1.00, 0.30, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.80, 0.00, 0.00, 0.00, 0.00],   //7
            [0.00, 0.00, 0.80, 0.00, 0.00, 0.00, 0.00, 0.30, 1.00, 0.00, 0.80, 0.00, 0.00, 0.00, 0.00, 0.60, 0.00, 0.00, 0.00, 0.00],   //8
            [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],   //9
            [0.00, 0.00, 0.95, 0.00, 0.00, 0.00, 0.00, 0.00, 0.80, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00, 0.50, 0.00, 0.00, 0.00, 0.00],   //10
            [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 0.80, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],   //11
            [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.80, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00],   //12
            [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 0.80, 0.00, 0.00, 0.00, 0.00, 0.00],   //13
            [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.80, 1.00, 0.00, 0.00, 0.00, 0.00, 0.00],   //14
            [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.80, 0.60, 0.00, 0.50, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00, 0.00, 0.00, 0.00],   //15
            [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 0.80, 0.00, 0.00],   //16
            [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.80, 1.00, 0.00, 0.00],   //17
            [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00, 0.00],   //18
            [0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 0.00, 1.00],   //19
        ]
    }
}
