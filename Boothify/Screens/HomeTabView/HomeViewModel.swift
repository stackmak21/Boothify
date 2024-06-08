//
//  HomeViewModel.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/2/24.
//

import Foundation


class HomeViewModel: BaseViewModel {
    @Published var activeTab: ActiveTab = .myEvents
    
}


enum ActiveTab: String {
    case myEvents
    case newEvents
}
