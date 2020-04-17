//
//  ContentView.swift
//  JSONViewExample
//
//  Created by Quentin Fasquel on 16/04/2020.
//  Copyright © 2020 QF CODES. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let url: URL = Bundle.main.url(forResource: "appStore-receipt", withExtension: "json")!

    @State var isPresented: Bool = false

    var body: some View {
        Button(action: toggleSheet) {
            Text("Open \(url.lastPathComponent)")
        }.sheet(isPresented: $isPresented) {
            JSONView(url: self.url)
        }
    }

    func toggleSheet() {
        isPresented.toggle()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
