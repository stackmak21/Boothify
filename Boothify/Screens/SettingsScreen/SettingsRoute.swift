//
//  SettingsRoute.swift
//  Boothify
//
//  Created by Paris Makris on 8/6/24.
//

import Foundation

class SettingsRoute: NavigationRoute {

    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .settings = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .settings = navigationCommand {
            coordinator.stack.push(.settings)
        }
    }
}
