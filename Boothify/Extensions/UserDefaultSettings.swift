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
    
    let userIDKey = "userID"

    func saveUser(_ theme: String) {
        UserDefaults.standard.set(theme, forKey: userIDKey)
    }

    func getUser() -> String?{
        guard let preference = UserDefaults.standard.string(forKey: userIDKey) else { return nil }
        return preference
    }
    
   
}
