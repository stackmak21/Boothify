//
//  UserDefaultSettings.swift
//  Boothify
//
//  Created by Paris Makris on 30/5/24.
//

import Foundation
import SwiftUI

class UserDefaultSettings: ObservableObject{
    
    static let shared = UserDefaultSettings()
    
    private init(){}
    
    let userNameKey = "userName"

    func saveUser(_ theme: String) {
        UserDefaults.standard.set(theme, forKey: userNameKey)
    }

    func getUser() -> String?{
        guard let preference = UserDefaults.standard.string(forKey: userNameKey) else { return nil }
        return preference
    }
    
   
}
