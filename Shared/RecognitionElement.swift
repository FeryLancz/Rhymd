//
//  RecognitionElement.swift
//  Rhymd
//
//  Created by Fery Lancz on 29.10.22.
//

import Foundation

struct RecognitionElement: Codable {
    var chars: String
    var vocalCodes: [Int8]
    var condition: RecognitionCondition
    var length: Int
    
    init(chars: String, vocalCodes: [Int8], condition: RecognitionCondition) {
        self.chars = chars
        self.vocalCodes = vocalCodes
        self.condition = condition
        self.length = chars.count
    }
}

enum RecognitionCondition: Codable {
    case everywhere, first, last, doubleAfter
}
