//
//  TrailingLabelStyle.swift
//  Boothify
//
//  Created by Paris Makris on 30/5/24.
//

import SwiftUI

struct TrailingLabelStyle: LabelStyle {
    func makeBody(configuration: Configuration) -> some View {
        HStack {
            configuration.title
            configuration.icon
        }
    }
}
