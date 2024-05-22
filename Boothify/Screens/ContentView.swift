//
//  ContentView.swift
//  Boothify
//
//  Created by Paris Makris on 21/5/24.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack {
                Image(uiImage: Asset.boothifyLogo.image)
                    .resizable()
                    .frame(width: 300, height: 200)
                Image(systemName: "globe")
                    .imageScale(.large)
                    .foregroundStyle(.tint)
                Text("Hello, world!")
            }
            .padding()
        }
    }

}

#Preview {
    ContentView()
}
