//
//  TextCoder.swift
//  Rhymd
//
//  Created by Fery Lancz on 29.10.22.
//

import Foundation

struct TextCoder {
    
    static func fastEncode(_ textInput: String) -> [Int8] {
        var vocalCode: [Int8] = []
        let text = textInput.lowercased()
        let textLength = text.count
        var index: Int = 0
        while index < textLength {
        recognitionElementLoop: for recognitionElement in Constants.Coder.recognitionElements {
            let neededChars = recognitionElement.condition == .doubleAfter ? recognitionElement.length + 1 : recognitionElement.length - 1
            if index + neededChars >= textLength { continue }   // quit looking if there are not enough characters left
            switch recognitionElement.condition {
            case .first where index == 0:
                fallthrough
            case .last where index == textLength - (recognitionElement.length):
                fallthrough
            case .everywhere:
                let subText = text[index..<(index + recognitionElement.length)]
                if subText == recognitionElement.chars {
                    vocalCode += recognitionElement.vocalCodes
                    index += recognitionElement.length - 1
                    break recognitionElementLoop
                }
            case .doubleAfter where (text[index + 1] == text[index + 2]):
                let subText = text[index..<(index + recognitionElement.length + 2)]
                if subText[0] == recognitionElement.chars {
                    vocalCode += recognitionElement.vocalCodes
                    index += recognitionElement.length - 1
                    break recognitionElementLoop
                }
            default: break
            }
        }
            index += 1
        }
        return vocalCode
    }
    
    
//    static func fastEncode2(_ textInput: String) -> [Int] {
//        // Use a dictionary to store the recognition elements
//        // for fast lookup and matching
//        let recognitionElements: [String: [Int]] = [
//            "aa": [0, 1],
//            "bb": [2, 3],
//            // ... other recognition elements
//        ]
//
//        var vocalCode: [Int] = []
//        let text = textInput.lowercased()
//        let textLength = text.count
//        var index = 0
//
//        while index < textLength {
//            // Use the `String.index(of:)` method to find the start
//            // and end indices of the substring to match
//            let startIndex = text.index(text.startIndex, offsetBy: index)
//            let endIndex = text.index(startIndex, offsetBy: 2, limitedBy: text.endIndex)
//
//            // Use the `String.substring(with:)` method to extract the substring
//            let subText = text[startIndex..<endIndex]
//
//            // Check if the substring matches any of the recognition elements
//            if let vocalCodes = recognitionElements[subText] {
//                // Add the matching vocal codes to the vocalCode array
//                vocalCode += vocalCodes
//
//                // Skip over the matched characters by incrementing the index
//                index += subText.count - 1
//            } else {
//                index += 1
//            }
//        }
//
//        return vocalCode
//    }

}
