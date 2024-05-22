//
//  BaseViewModel.swift
//  Boothify
//
//  Created by Paris Makris on 22/5/24.
//

import Foundation

class BaseViewModel: ObservableObject {
    let navigator: Navigator = NavigationViewModel.shared.navigator
}
