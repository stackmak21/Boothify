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
                    
                }
                
            }
        }
    }
}

#Preview {
    HomeScreen()
}
