//
//  GermanDictionary.swift
//  RhymdBase
//
//  Created by Fery Lancz on 30.10.22.
//

import Foundation

class GermanDictionary: ObservableObject {
    @Published var words: [String] = []
    
    func load() async {
        do {
            if let path = Bundle.main.path(forResource: Constants.GermanDictionary.filename, ofType: Constants.GermanDictionary.fileExtension) {
                let strings = try String(contentsOfFile: path, encoding: .isoLatin1).components(separatedBy: "\r\n")
                DispatchQueue.main.async {
                    self.words = strings
                }
            }
        } catch let error as NSError { print(error) }
    }
}
