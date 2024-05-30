//
//  HomeScreen.swift
//  Boothify
//
//  Created by Paris Makris on 22/5/24.
//

import SwiftUI

struct HomeScreen: View {
    @StateObject var onBoardingViewModel = OnBoardingScreenViewModel()
    
    var body: some View {
        Group{
            if onBoardingViewModel.isUserOnBoarding{
                OnBoardingContent(vm: onBoardingViewModel)
            }
            else{
                HomeScreenContent()
            }
        }
        .navigationBarHidden(true)
        .allowSwipeBack(allow: false)
    }
}

struct HomeScreenContent: View {
    
    @StateObject var vm = HomeScreenViewModel()
    
    var body: some View {
        GeometryReader{ container in
            ZStack{
                Color.background.ignoresSafeArea()
                VStack(spacing: 0){
                    HStack{
                        Image(uiImage: Asset.boothifyLogo.image)
                            .resizable()
                            .frame(width: 140, height: 100)
                        Spacer()
                        Button(
                            action: {
                                
                            },
                            label: {
                                Image(systemName: "gear")
                                    .resizable()
                                    .renderingMode(.template)
                                    .frame(width: 30, height: 30)
                                    .foregroundColor(Color.activeGreen)
                            })
                        
                    }
                    .shadow(length: .long)
                    .padding(.horizontal)
                    .background(Color.backgroundNight.ignoresSafeArea())
                    Spacer()
                    
                    ScrollView(.vertical) {
                        ForEach(1..<5) { i in
                            ListingItem()
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    HomeScreen()
}
