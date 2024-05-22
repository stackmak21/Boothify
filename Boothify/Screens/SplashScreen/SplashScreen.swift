//
//  SplashScreen.swift
//  Boothify
//
//  Created by Paris Makris on 22/5/24.
//

import SwiftUI

struct SplashScreen: View {
    
    @StateObject var vm: SplashScreenViewModel = SplashScreenViewModel()
    
    var body: some View {
        SplashScreenContent(vm: vm)
    }
}

struct SplashScreenContent: View {
    
    @ObservedObject var vm: SplashScreenViewModel
    
    var body: some View {
        ZStack{
            Color.black.ignoresSafeArea()
            VStack{
                Image(uiImage: Asset.boothifyLogo.image)
                    .resizable()
                    .frame(width: 250, height: 150)
            }
        }
        .onAppear{
            DispatchQueue.main.asyncAfter(deadline: .now() + 2){
                vm.navigator.navigate(.home)
            }
        }
    }
}

#Preview {
    SplashScreen()
}
