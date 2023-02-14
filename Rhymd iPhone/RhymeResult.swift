//
//  RhymeResult.swift
//  Rhymd
//
//  Created by Fery Lancz on 13.11.22.
//

import Foundation

class RhymeResult: Identifiable {
    var searchWord: String
    var rhymeWord: String
    var vocalCode: [Int8]
    var rating: Double
    
    init(searchWord: String, rhymeWord: String, vocalCode: [Int8], rating: Double) {
        self.searchWord = searchWord
        self.rhymeWord = rhymeWord
        self.vocalCode = vocalCode
        self.rating = rating
    }
    
    convenience init(text: String) {
        self.init(searchWord: "", rhymeWord: text, vocalCode: [], rating: 1.0)
    }
}
