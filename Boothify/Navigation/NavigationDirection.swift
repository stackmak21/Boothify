//
//  NavigationDirection.swift
//  WrenchWizard
//
//  Created by Paris Makris on 5/3/24.
//

import Foundation

struct NavigationDirection {
    let command: NavigationCommand
}


enum NavigationCommand{
    case home
    case eventDetails(_ event: BoothifyEvent)
    case settings
    case onBoarding
    case myEvents
    case newEvents
    case splash
    case goBack
    case goToRoot
}
