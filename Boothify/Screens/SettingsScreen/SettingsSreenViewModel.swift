//
//  SettingsSreenViewModel.swift
//  Boothify
//
//  Created by Paris Makris on 8/6/24.
//

import Foundation

class SettingsScreenViewModel: BaseViewModel{
    @Published var userID: String = ""
    
    func getUserID(){
        if let fetchedUserID = userDefaultSettings.getUser(){
            print(fetchedUserID)
            userID = fetchedUserID
        }
    }
}
