//
//  OnBoardingScreenViewModel.swift
//  Boothify
//
//  Created by Paris Makris on 30/5/24.
//

import Foundation
import SwiftUI

class OnBoardingScreenViewModel: BaseViewModel {
    
    @Published var userId: String = ""
    @Published var isNextAllowed : Bool = false
    @Published var isEditMode: Bool = false
    
    
    private func onBoardingCompleted(){
        if isEditMode{
            navigator.goBack()
        }else{
            navigator.navigate(.home)
        }
    }
    
    func isTextFieldEmpty() {
        isNextAllowed = !userId.isEmpty
    }
    
    func onClick() {
        userDefaultSettings.saveUser(userId)
        onBoardingCompleted()
    }
    
    func getUserID(){
        if let currentUserID = userDefaultSettings.getUser(){
            isEditMode = true
        }
    }
}
