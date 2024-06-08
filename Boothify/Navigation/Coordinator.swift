//
//  NavigationDeck.swift
//  WrenchWizard
//
//  Created by Paris Makris on 2/3/24.
//

import Foundation
import SwiftUI
import FlowStacks

typealias NavigationStack = Routes<Screen>

enum Screen: Equatable {
    case eventDetails(_ event: BoothifyEvent)
    case onBoarding
    case home
    case splash
    case settings
}


class Coordinator: ObservableObject {
    @Published var stack: NavigationStack
    
    init() {
        stack = [.root(.splash, embedInNavigationView: true)]
    }
}


struct HostView: View {
    @ObservedObject var coordinator: Coordinator
    
    var body: some View{
        Router($coordinator.stack) { screen, _ in
            switch screen {
            case .home:
                HomeScreen()
            case .splash:
                SplashScreen()
            case .eventDetails(let event):
                EventDetailsScreen(event: event)
            case .onBoarding:
                OnBoardingContent()
            case .settings:
                SettingsScreen()
            }
        
        }
        
    }
}
