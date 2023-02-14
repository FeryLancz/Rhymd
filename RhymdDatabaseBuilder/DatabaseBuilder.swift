//
//  DatabaseBuilder.swift
//  Rhymd
//
//  Created by Fery Lancz on 30.10.22.
//

import Foundation

struct DatabaseBuilder {
    static func build(from strings: [String]) async -> RhymdDatabase {
        let database = RhymdDatabase()
        
        // MARK: - Element Generation
        let vocalCodes = strings.map { TextCoder.fastEncode($0) }
        let allElements = Dictionary(uniqueKeysWithValues: zip(strings, vocalCodes))
        for element in allElements {
            let numberOfVocalCodes = element.value.count
            if numberOfVocalCodes == 0 { continue }
            while database.elements.count < numberOfVocalCodes {
                database.elements.append([:])
            }
            database.elements[element.value.count - 1].updateValue(element.value, forKey: element.key)
        }
        
        // MARK: - Available Vocal Codes Generation
        for i in 0..<database.elements.count {
            while database.availableVocalCodes.count < i + 1 {
                database.availableVocalCodes.append(Set<[Int8]>())
            }
            for element in database.elements[i] {
                database.availableVocalCodes[i].insert(element.value)
            }
        }
        
        return database
    }
}
