//
//  OnBoardingScreenViewModel.swift
//  Boothify
//
//  Created by Paris Makris on 30/5/24.
//

import Foundation
import SwiftUI

class OnBoardingScreenViewModel: BaseViewModel {
    
    @Published var isUserOnBoarding: Bool = true
    @Published var userName: String = ""
    @Published var isNextAllowed : Bool = false
    
    override init(){
        super.init()
        
        if let savedUserName = userDefaultSettings.getUser() {
            self.userName = savedUserName
            onBoardingCompleted()
        }
    }
    
    private func onBoardingCompleted(){
        isUserOnBoarding = false
    }
    
    func isTextFieldEmpty() {
        isNextAllowed = !userName.isEmpty
    }
    
    func onNextClicked() {
        userDefaultSettings.saveUser(userName)
        withAnimation {
            onBoardingCompleted()
        }
    }
}
