//
//  ContentView.swift
//  Rhymd
//
//  Created by Fery Lancz on 12.08.22.
//

import SwiftUI
import AVFAudio

struct MainView: View {
    @Environment(\.colorScheme) var colorScheme
    @State var textInput = ""
    @State var title = "Rhymd"
    @State var db = RhymdDatabase()
    @State var progressText = "0 elements"
    @State var foundElements: [String] = ["empty"]
    var inputVocalCode: [Int8] {
        TextCoder.fastEncode(textInput)
    }
    
    var body: some View {
        ZStack {
            Color("BackgroundColor")
                .ignoresSafeArea()
            VStack(spacing: 30) {
                HStack {
                    Text(title.uppercased())
                        .font(.largeTitle)
                        .fontWeight(.bold)
                        .kerning(5.0)
                        .foregroundColor(Color("TitleColor"))
                        .id("Title" + title)
                        .transition(.opacity)
                    Spacer()
                    Button {
                        
                    } label: {
                        ZStack {
                            Image(systemName: "star")
                                .font(.title2)
                                .foregroundColor(Color("FavouritesIconColor"))
                                
                        }
                    }
                }
                .animation(.easeInOut, value: title)
                .padding(.trailing, 15)
                HStack(alignment: .top, spacing: 20) {
                    if colorScheme == .light {
                        ZStack(alignment: .bottom) {
                            ZStack {
                                Color("TextFieldBackgroundColor")
                                    .cornerRadius(20)
                                    .padding(.leading, 10)
                                    .padding(.trailing, 30)
                                
                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(Color("TextFieldIconColor"))
                                    TextField("", text: $textInput)
                                        .placeholder(when: textInput.isEmpty) {
                                            Text("Wort eingeben").foregroundColor(Color("TextFieldPlaceholderColor"))
                                                .font(.subheadline)
                                        }
                                        .foregroundColor(Color("TextFieldTextColor"))
                                        
                                }
                                .padding(.leading, 20)
                                .padding(.bottom, 10)
                            }
                            
                            Rectangle()
                                .frame(height: 2.0)
                                .foregroundColor(Color("TextFieldLineColor"))
                                .padding(.bottom, 20)
                                
                        }
                        .frame(maxHeight: 65)
                    }
                    else {
                        ZStack(alignment: .bottom) {
                            ZStack {
                                Color("TextFieldBackgroundColor")
                                    .cornerRadius(20)
                                    .padding(.trailing, 10)
                                    .padding(.bottom, 10)

                                HStack {
                                    Image(systemName: "magnifyingglass")
                                        .foregroundColor(Color("TextFieldIconColor"))
                                    TextField("", text: $textInput)
                                        .placeholder(when: textInput.isEmpty) {
                                            Text("Wort eingeben").foregroundColor(Color("TextFieldPlaceholderColor"))
                                                .font(.subheadline)
                                        }
                                        .foregroundColor(Color("TextFieldTextColor"))
                                        
                                }
                                .padding(.horizontal, 25)
                                
                                RoundedRectangle(cornerRadius: 20)
                                    .strokeBorder(Color("TextFieldLineColor"), lineWidth: 2)
                                    .padding(.leading, 10)
                                    .padding(.top, 10)
                                
                            }
                        }
                        .frame(maxHeight: 75)
                    }
                    Button {
                        
                    } label: {
                        Image(systemName: "slider.horizontal.3")
                            .font(.title2)
                            .foregroundColor(Color("SettingsButtonTextColor"))
                            .padding()
                            .background {
                                Color("SettingsButtonBackgroundColor")
                            }
                            .cornerRadius(20)
                    }
                    
                    
                }
                HStack {
                    Text(progressText)
                    Button {
                        Task(priority: .userInitiated) {
                            progressText = "loading..."
                            db = await DBLoader.loadDatabase()
                            progressText = "\(db.elements.count) loaded"
                        }
                        
                    } label: {
                        Text("Load Elements")
                    }
                }
                Button("Search") {
                    //DispatchQueue.cancelPreviousPerformRequests(withTarget: )
                    progressText = "searching..."
                    foundElements.removeAll()
                    DispatchQueue.global(qos: .userInitiated).async {
                        print(db.elements.count)
                        print(inputVocalCode)
                        for el in db.elements[inputVocalCode.count - 1] {
                            if el.value == inputVocalCode {
                                print(el.key)
                                DispatchQueue.main.async {
                                    foundElements.append(el.key)
                                }
                            }
                        }
                        DispatchQueue.main.async {
                            progressText = "\(foundElements.count) elements found"
                        }
                    }
                }
                List(foundElements, id: \.self) { element in
                    Text(element)
                }
                Spacer()
            }
            .padding(.top, 30)
            .padding(.horizontal, 20)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}

extension View {
    func placeholder<Content: View>(
        when shouldShow: Bool,
        alignment: Alignment = .leading,
        @ViewBuilder placeholder: () -> Content) -> some View {

        ZStack(alignment: alignment) {
            placeholder().opacity(shouldShow ? 1 : 0)
            self
        }
    }
}
