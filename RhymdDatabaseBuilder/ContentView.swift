//
//  ContentView.swift
//  Rhymd
//
//  Created by Fery Lancz on 29.10.22.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var dict = GermanDictionary()
    
    @State var numberToTest = 50
    let errorChecking = false
    @State var progress = 0.0
    @State var processingTime = 0.0
        
    var body: some View {
        VStack {
            Text("\(dict.words.count) words loaded")
            Text("\(numberToTest) for testing")
            Divider()
            Button("Calculate Codes") {
                let input = dict.words //Array(dict.words[0...(numberToTest - 1)])
                Task {
                    let db = await DatabaseBuilder.build(from: input)
                    progress = 1.0
                    
                    do {
//                        do {
//                            let applicationSupport = FileManager.default.urls(for: .applicationSupportDirectory, in: .userDomainMask).first!
//                            let bundleID = Bundle.main.bundleIdentifier ?? "com.lancz"
//                            let appSupportSubDirectory = applicationSupport.appendingPathComponent(bundleID,isDirectory: true)
//                            try FileManager.default.createDirectory(at: appSupportSubDirectory, withIntermediateDirectories: true, attributes: nil)
//                            
//                            
//                            let encodedData = try JSONEncoder().encode(db)
//                            let url = appSupportSubDirectory.appendingPathComponent("test.json")
//                            print(url)
//                            try encodedData.write(to: url)
//                        } catch {
//                            print(error)
//                        }
                        
                        
                        
                        
                        let encodedData = try JSONEncoder().encode(db)
                        
                        let url = getDocumentsDirectory().appendingPathComponent("large.json")
                        print(url)
                        try encodedData.write(to: url)
                        
                    } catch {
                        print(error.localizedDescription)
                    }
                }
            }
            .disabled(dict.words.count == 0)
            
            Text(String(format: "%.2f", progress * 100.0) + "%")
            ProgressView(value: progress)
            Text("Processing Time: " + (processingTime == 0 ? "-" : String(format: "%.2f", processingTime)) + " Seconds")
        }
        .padding()
        .onAppear {
            Task {
                await dict.load()
            }
        }
    }
    
    func getDocumentsDirectory() -> URL {
        let paths = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return paths[0]
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
