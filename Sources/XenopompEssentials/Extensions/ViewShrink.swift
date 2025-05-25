//
//  ViewShrink.swift
//  XenopompEssentials
//
//  Created by Александр on 09.12.2024.
//

import SwiftUI

public enum Dimensions {
    case width, height, both
}

struct Shrink: ViewModifier {
    var dimension: Dimensions
    var alignment: Alignment = .center
    
    func body(content: Content) -> some View {
        switch self.dimension {
            case .width:
                return content.frame(maxWidth: .infinity, alignment: self.alignment)
            
            case .height:
                return content.frame(maxHeight: .infinity, alignment: self.alignment)
            
            case .both:
                return content.frame(maxWidth: .infinity, maxHeight: .infinity, alignment: self.alignment)
        }
    }
}

extension View {
    /// Shrinks view to whole width/height/both dimensions.
    public func shrink(at dimension: Dimensions) -> some View {
        modifier(Shrink(dimension: dimension))
    }
    
    /// Shrinks view to whole width/height/both dimensions and aligns it.
    public func shrink(at dimension: Dimensions, align: Alignment) -> some View {
        modifier(Shrink(dimension: dimension, alignment: align))
    }
}

#Preview {
    ScrollView {
        VStack(spacing: 10) {
            Text("Shrinked to .leading!")
                .shrink(at: .width, align: .leading)
                .padding(20)
                .background(Color.red)
                .clipShape(.rect(cornerRadius: 12))
            
            Text("Shrinked to .center!")
                .shrink(at: .width, align: .center)
                .padding(20)
                .background(Color.red)
                .clipShape(.rect(cornerRadius: 12))
            
            Text("Shrinked to .trailing!")
                .shrink(at: .width, align: .trailing)
                .padding(20)
                .background(Color.red)
                .clipShape(.rect(cornerRadius: 12))
        }
    }
}
