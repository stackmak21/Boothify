//
//  HomeScreen.swift
//  Boothify
//
//  Created by Paris Makris on 22/5/24.
//

import SwiftUI

struct MyEventsScreen: View {
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
    }
}


struct HomeScreenContent: View {
    
    @StateObject var vm = MyEventsScreenViewModel()
    
    var body: some View {
        GeometryReader{ container in
            ZStack{
                Color.background.ignoresSafeArea()
                VStack(spacing: 0){

                    ScrollView(.vertical) {
                        ForEach(1..<10) { i in
                            ListingItem()
                                .padding(.top)
                                .padding(.horizontal)
                                .padding(.bottom, 6)
                        }
                    }
                }
            }
        }
    }
}


#Preview {
    MyEventsScreen()
}
