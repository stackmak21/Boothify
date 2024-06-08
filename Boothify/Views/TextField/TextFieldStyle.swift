//
//  TextFieldStyle.swift
//  Boothify
//
//  Created by Paris Makris on 29/5/24.
//

import Foundation
import SwiftUI

struct TextFieldStyleAttributes {
    var textFieldHeight: CGFloat
    var typography: TextFieldTyporaphySet
    var colors: TextFieldColorSet
    
    static var outlined: TextFieldStyleAttributes {
        TextFieldStyleAttributes(
            textFieldHeight: normalTextFieldHeight,
            typography: outlinedTextFieldTypohraphy,
            colors: outlinedTextFieldColors
        )
    }
    
    static var outlinedSmall: TextFieldStyleAttributes {
        var outlined = TextFieldStyleAttributes.outlined
        outlined.textFieldHeight = smallTextFieldHeight
        return outlined
    }
    
    
    static func custom(
        textFieldHeight: CGFloat,
        typography: TextFieldTyporaphySet = outlinedTextFieldTypohraphy,
        colors: TextFieldColorSet = outlinedTextFieldColors
    ) -> TextFieldStyleAttributes{
        var outlined = TextFieldStyleAttributes.outlined
        outlined.textFieldHeight = textFieldHeight
        return outlined
    }
}

struct TextFieldColorSet {
    var normalForeground: Color
    var focusedForeground: Color
    var disabledForeground: Color

    var normalBackground: Color
    var focusedBackground: Color
    var disabledBackground: Color
    
    
    var normalAccent: Color
    var focusedAccent: Color
    var disabledAccent: Color
    
    var normalBorder: Color
    var focusedBorder: Color
    var disabledBorder: Color
    
    var helper: Color
    var error: Color
    var label: Color
    
    
    func backgroundColor(isEnabled: Bool, isFocused: Bool) -> Color {
        if isEnabled {
            return isFocused ? focusedBackground : normalBackground
        } else {
            return disabledBackground
        }
    }
 
    func foregroundColor(isEnabled: Bool, isFocused: Bool) -> Color {
        if isEnabled {
            return isFocused ? focusedForeground : normalForeground
        } else {
            return disabledForeground
        }
    }
    
    func borderColor(isEnabled: Bool, isFocused: Bool) -> Color {
        if isEnabled {
            return isFocused ? focusedBorder : normalBorder
        } else {
            return disabledForeground
        }
    }
    
    func accentColor(isEnabled: Bool, isFocused: Bool, isError: Bool) -> Color {
        if isEnabled {
            if isError {
                return error
            } else {
                return isFocused ? focusedAccent : normalAccent
            }
        } else {
            return disabledAccent
        }
    }

    func helperColor(isEnabled: Bool, isError: Bool) -> Color {
        if isEnabled {
            return isError ? error : helper
        } else {
            return disabledAccent
        }
    }

}

struct TextFieldTyporaphySet {
    var content: Font
    var label: Font
    var hint: Font
    var helper: Font
}

let outlinedTextFieldColors = TextFieldColorSet(
    normalForeground: Color.gray,
    focusedForeground: Color.letterGray,
    disabledForeground: Color.gray,
    normalBackground: Color.clear,
    focusedBackground: Color.clear,
    disabledBackground: Color.clear,
    normalAccent: Color.clear,
    focusedAccent: Color.clear,
    disabledAccent: Color.clear,
    normalBorder: Color.letterGray.opacity(0.2),
    focusedBorder: Color.letterGreen.opacity(0.6),
    disabledBorder: Color.letterGray,
    helper: Color.clear,
    error: Color.orange,
    label: Color.letterGreen
)

let outlinedTextFieldTypohraphy = TextFieldTyporaphySet(
    content: Typography.medium(size: 16),
    label: Typography.bold(size: 16),
    hint: Typography.medium(size: 12),
    helper: Typography.medium(size: 14)
)

let normalTextFieldHeight: CGFloat = 54
let smallTextFieldHeight: CGFloat = 48

