//
//  BoothifyMapMarker.swift
//  Boothify
//
//  Created by Paris Makris on 2/6/24.
//

import SwiftUI

struct BoothifyMapMarker: View {
    

    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                Color.black
                Image(uiImage: Asset.boothifyLogo.image)
                    .resizable()
                    .frame(width: 32, height: 30)
                    .padding()
            }
            .frame(width: 40, height: 40)
            .clipShape(Circle())
            Image(systemName: "triangle.fill")
                .resizable()
                .renderingMode(.template)
                .scaledToFit()
                .foregroundColor(.black)
                .frame(width: 10, height: 10)
                .rotationEffect(.degrees(180))
                .frame(alignment: .bottom)
                .offset(x: 1, y: -3)
                .padding(.bottom, 30)
        }
        
    }
}

#Preview {
    BoothifyMapMarker()
}
