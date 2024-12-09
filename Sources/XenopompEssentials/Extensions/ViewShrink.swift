//
//  ViewShrink.swift
//  XenopompEssentials
//
//  Created by Александр on 09.12.2024.
//

import SwiftUI

enum Dimensions {
    case width, height, both
}

struct Shrink: ViewModifier {
    var dimension: Dimensions
    
    func body(content: Content) -> some View {
        switch self.dimension {
            case .width:
                return content.frame(maxWidth: .infinity)
            
            case .height:
                return content.frame(maxHeight: .infinity)
            
            case .both:
                return content.frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

extension View {
    /// Shrinks view to whole width/height/both dimensions.
    func shrink(at dimension: Dimensions) -> some View {
        modifier(Shrink(dimension: dimension))
    }
}

#Preview {
    Text("Shrinked!")
        .shrink(at: .width)
        .background(Color.red)
}
