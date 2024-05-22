//
//  BoothifyApp.swift
//  Boothify
//
//  Created by Paris Makris on 21/5/24.
//

import SwiftUI

@main
struct BoothifyApp: App {
    
    init(){}
    
    var body: some Scene {
        WindowGroup {
            HostView(coordinator: NavigationViewModel.shared.router.coordinator)
        }
    }
}
