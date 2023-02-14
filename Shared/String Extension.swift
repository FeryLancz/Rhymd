//
//  StringExtensions.swift
//  Rhymd
//
//  Created by Fery Lancz on 29.10.22.
//

import Foundation

extension String {
    
    subscript (i: Int) -> String {
        let char = self[index(startIndex, offsetBy: i)]
        return String(char)
    }
    
    subscript (bounds: CountableClosedRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start...end])
    }
    
    subscript (bounds: CountableRange<Int>) -> String {
        let start = index(startIndex, offsetBy: bounds.lowerBound)
        let end = index(startIndex, offsetBy: bounds.upperBound)
        return String(self[start..<end])
    }
    
    func insensitiveCompare(to s2: String) -> Bool {
        if self.caseInsensitiveCompare(s2) == ComparisonResult.orderedSame {
            return true
        }
        return false
    }
    
    func slice(from: String, to: String) -> String? {
        return (range(of: from)?.upperBound).flatMap { substringFrom in
            (range(of: to, range: substringFrom..<endIndex)?.lowerBound).map { substringTo in
                String(self[substringFrom..<substringTo])
            }
        }
    }
}
