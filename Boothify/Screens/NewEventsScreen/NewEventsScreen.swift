//
//  NewEventsScreen.swift
//  Boothify
//
//  Created by Paris Makris on 2/6/24.
//

import SwiftUI

struct NewEventsScreen: View {
    @StateObject var vm = NewEventsViewModel()
    
    var body: some View {
        NewEventsContent(vm: vm)
    }
}

struct NewEventsContent: View {
    
    @ObservedObject var vm: NewEventsViewModel
    
    var body: some View {
        GeometryReader{ container in
            ZStack{
                Color.background.ignoresSafeArea()
                VStack(spacing: 0){
                        EmptyContent(
                            title: "Screen under construction",
                            description: "New feature for employees to be able accept or decline events",
                            image: Asset.emptyContent.image
                        )
                }
            }
        }
    }
}

struct EmptyContent: View {
    
    let title: String
    let description: String
    let image: UIImage
    
    var body: some View {
        VStack(spacing: 0){
            Image(uiImage: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(height: 160)
            Text(title)
                .font(Typography.medium(size: 20))
                .foregroundStyle(.white)
                .padding()
            Text(description)
                .font(Typography.regular(size: 14))
                .multilineTextAlignment(.center)
                .foregroundStyle(.letterGray)
                .padding(.horizontal)
        }
    }
}

#Preview {
    NewEventsScreen()
}
