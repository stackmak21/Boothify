//
//  HomeScreen.swift
//  Boothify
//
//  Created by Paris Makris on 22/5/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject var vm: HomeScreenViewModel = HomeScreenViewModel()
    
    var body: some View {
        HomeScreenContent(vm: vm)
    }
}

struct HomeScreenContent: View {
    
    @ObservedObject var vm: HomeScreenViewModel
    
    var body: some View {
        VStack{
            Text("Welcome")
        }
        .navigationBarHidden(true)
        .allowSwipeBack(allow: false)
    }
}

#Preview {
    HomeScreen()
}
