//
//  HomeScreenRoute.swift
//  Boothify
//
//  Created by Paris Makris on 22/5/24.
//

import Foundation

class HomeScreenRoute: NavigationRoute {

    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .home = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .home = navigationCommand {
            coordinator.stack.push(.home)
        }
    }
}
