//
//  OnboardingRoute.swift
//  Boothify
//
//  Created by Paris Makris on 3/6/24.
//

import Foundation

class OnBoardingRoute: NavigationRoute {

    func canRoute(navigationCommand: NavigationCommand) -> Bool {
        if case .onBoarding = navigationCommand{
            return true
        }
        return false
    }
    
    func navigate(coordinator: Coordinator, navigationCommand: NavigationCommand) {
        if case .onBoarding = navigationCommand {
            coordinator.stack.push(.onBoarding)
        }
    }
}
