//
//  ButtonExtensions.swift
//  XenopompEssentials
//
//  Created by Александр on 25.05.2025.
//

import Foundation
import SwiftUI

struct PressableViewModifier: ViewModifier {
    var action: (() -> Void)?
    
    func body(content: Content) -> some View {
        Button(action: action ?? {}, label: {
            content
        })
    }
}

extension View {
    /// Makes view pressable by wrapping it with Button view
    func pressable(_ callback: @escaping () -> Void) -> some View {
        modifier(PressableViewModifier(action: callback))
    }
}
