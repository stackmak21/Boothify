//
//  EventDetailsRoute.swift
//  Boothify
//
//  Created by Paris Makris on 2/6/24.
//

import Foundation

class EventDetailsRoute: NavigationRoute {

    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .eventDetails(_) = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .eventDetails(let event) = navigationCommand {
            coordinator.stack.push(.eventDetails(event))
        }
    }
}
