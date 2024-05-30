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
            (vm.animateToLightScreen ? Color.black : Color.white).ignoresSafeArea()
            VStack{
                Image(uiImage: Asset.boothifyLogo.image)
                    .resizable()
                    .renderingMode(.template)
                    .foregroundColor(vm.animateToLightScreen ? Color.white : Color.black)
                    .frame(width: 250, height: 150)
                LoadingDoubleHelix()
                    .animation(nil, value: vm.animateToLightScreen)
            }
        }
        .animation(.default, value: vm.animateToLightScreen)
        .onAppear{
            Task{
                await vm.toggleAnimation()
                await vm.navigateToHome()
            }
        }
    }
}

#Preview {
    SplashScreen()
}
