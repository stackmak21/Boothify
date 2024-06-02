//
//  DismissKeyboardModifier.swift
//  Boothify
//
//  Created by Paris Makris on 30/5/24.
//

import Foundation
import SwiftUI

struct DismissKeyboard: ViewModifier {
    func body(content: Content) -> some View {
        content
            .background(Color.white.opacity(0.001))
            .onTapGesture {
                UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
            }
    }
}


extension View{
    
    func hideKeyboardWhenTappedAround() -> some View{
        self.modifier(DismissKeyboard())
    }
}
