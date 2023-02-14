//
//  RhymeSearchView.swift
//  Rhymd
//
//  Created by Fery Lancz on 13.11.22.
//

import SwiftUI

struct RhymeSearchView: View {
    @State var textInput = ""
    @State var logoText = ""
    @State var results: [RhymeResult]
    
    var body: some View {
        
        ZStack {
            //Background
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack {
                //Logo and Favourites Button
                HStack {
                    DynamicLogo(text: $logoText)
                    Spacer()
                    Button {
                        
                    } label: {
                        Image(systemName: "star.fill")
                    }
                }
                .padding(.vertical)
                //Search Bar and Settings
                HStack {
                    TextField("Asd", text: $textInput)
                    Button {
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                    }
                }
                
                List(results) { result in
                    RhymeResultListView(item: result)
                }
                .scrollContentBackground(.hidden)
                .frame(height: .infinity)
            }
            .padding()
        }
        
    }
}

struct RhymeResultListView: View {
    var item: RhymeResult
    var body: some View {
        Text(item.rhymeWord)
    }
}

struct DynamicLogo: View {
    @Binding var text: String
    var body: some View {
        Image(systemName: "text.quote")
        let logoText = text == "" ? "RHYMD" : text.uppercased()
        Text(logoText)
    }
}

struct StandardButton: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
    }
}

struct RhymeSearchView_Previews: PreviewProvider {
    static var previews: some View {
        let results = [
            RhymeResult(text: "Apfelbaum"),
            RhymeResult(text: "Tannenzapfen"),
            RhymeResult(text: "Kakerlaken"),
            RhymeResult(text: "Hantelstangen"),
            RhymeResult(text: "Blattsteinsamen"),
        ]
        RhymeSearchView(results: results)
    }
}
