//
//  BoothifyApp.swift
//  Boothify
//
//  Created by Paris Makris on 21/5/24.
//

import SwiftUI

//#if DEBUG
import FirebaseCore
//
class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      return true
  }
}
//#endif

@main
struct BoothifyApp: App {
    
//    #if DEBUG
    @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate
//    #endif
    
    init(){
        configureNavigationBar()
    }
    
    var body: some Scene {
        WindowGroup {
            HostView(coordinator: NavigationViewModel.shared.router.coordinator)
        }
    }
    
    private func configureNavigationBar() {
        let backgroundColor = UIColor(Color.backgroundLight)
        let foregroundColor = UIColor(Color.white)
        
        let coloredAppearance = UINavigationBarAppearance()
        coloredAppearance.configureWithOpaqueBackground()
        coloredAppearance.backgroundColor = backgroundColor
        coloredAppearance.titleTextAttributes = [.foregroundColor: foregroundColor]
        coloredAppearance.largeTitleTextAttributes = [.foregroundColor: foregroundColor]
        
        UINavigationBar.appearance().standardAppearance = coloredAppearance
        UINavigationBar.appearance().compactAppearance = coloredAppearance
        UINavigationBar.appearance().scrollEdgeAppearance = coloredAppearance
        UINavigationBar.appearance().tintColor = foregroundColor
    }
}
