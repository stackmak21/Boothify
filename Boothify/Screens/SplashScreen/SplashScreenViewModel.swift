//
//  SplashScreenViewModel.swift
//  Boothify
//
//  Created by Paris Makris on 22/5/24.
//

import Foundation

@MainActor
class SplashScreenViewModel: BaseViewModel{
    
    @Published var animateToLightScreen: Bool = false
    
    func toggleAnimation() async {
        try? await Task.sleep(nanoseconds: 1_000_000_000)
        animateToLightScreen.toggle()
    }
    
    func navigateToHome() async {
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        navigateToHomeOrOnBoarding()
    }
    
    private func navigateToHomeOrOnBoarding(){
        if let savedUserID = userDefaultSettings.getUser() {
            navigator.navigate(.home)
        }else{
            navigator.navigate(.onBoarding)
        }
    }
}
