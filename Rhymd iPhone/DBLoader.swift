//
//  DBLoader.swift
//  Rhymd
//
//  Created by Fery Lancz on 30.10.22.
//

import Foundation

struct DBLoader {
    static func loadDatabase() async -> RhymdDatabase {
        var db = RhymdDatabase()
        do {
            if let path = Bundle.main.path(forResource: "large", ofType: "json") {
                let url = URL(fileURLWithPath: path)
                let JsonData = try Data(contentsOf: url)
                db = try JSONDecoder().decode(RhymdDatabase.self, from: JsonData)
            }
        } catch let error as NSError {
            print(error)
        }
        return db
    }
}
