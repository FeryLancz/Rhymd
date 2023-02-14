//
//  TextViews.swift
//  Rhymd
//
//  Created by Fery Lancz on 12.08.22.
//

import SwiftUI

struct TitleText: View {
    var text: String
    init(_ text: String) { self.text = text }
    var body: some View {
        Text(text.uppercased())
            .font(.largeTitle)
            .foregroundColor(Color("TitleColor"))
            .fontWeight(.bold)
            .kerning(4.0)
    }
}

struct RhymeFont: View {
    var text: String
    init(_ text: String) { self.text = text }
    
    var body: some View {
        Text(text)
            .font(Font.custom("Menlo-Regular", size: 30))
            .fontWeight(.thin)
            .foregroundColor(Color("RhymeTextColor"))
            .kerning(8)
            .multilineTextAlignment(.center)
    }
}

struct TextViews_Previews: PreviewProvider {
    static var previews: some View {
        VStack(spacing: 10) {
            TitleText("Title Text")
            RhymeFont("Rhyme Font")
        }
    }
}
