//
//  Navigator.swift
//  WrenchWizard
//
//  Created by Paris Makris on 3/3/24.
//

import Foundation
import Combine

class Navigator: ObservableObject {
    
    let directionSubject = PassthroughSubject<NavigationDirection, Never>()
    
    func navigate(_ command: NavigationCommand) {
        directionSubject.send(NavigationDirection(command: command))
    }
    
    func goBack(){
        navigate(.goBack)
        
    }
    
    func goToRoot(){
        navigate(.goToRoot)
    }
}


