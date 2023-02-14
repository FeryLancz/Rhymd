//
//  WordBase.swift
//  Rhymd
//
//  Created by Fery Lancz on 29.10.22.
//

import Foundation

class RhymdDatabase: Codable, ObservableObject {
    var elements: [[String: [Int8]]] = []
    var availableVocalCodes = [Set<[Int8]>]()
    var recognitionElements: [RecognitionElement] = []
    var comparisonTable: [[Double]] = [[]]
    
    init() {
        recognitionElements = Constants.Coder.recognitionElements
        comparisonTable = Constants.Coder.comparisonTable
    }
}
