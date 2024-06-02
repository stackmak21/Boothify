//
//  HomeViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/2/24.
//

import Foundation


class HomeViewModel: ObservableObject {
    @Published var activeTab: ActiveTab = .newEvents
    
}


enum ActiveTab: String {
    case myEvents
    case newEvents
}
