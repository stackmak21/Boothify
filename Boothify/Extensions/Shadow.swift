//
//  Shadow.swift
//  Boothify
//
//  Created by Paris Makris on 30/5/24.
//

import Foundation
import SwiftUI

enum ShadowLength: CGFloat {
    case short = 1.0
    case medium = 2.0
    case long = 3.0
}

extension View {
    func shadow(length: ShadowLength) -> some View {
        return shadow(radius: length.rawValue)
    }
}
