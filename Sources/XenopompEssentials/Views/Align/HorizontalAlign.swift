//
//  HorizontalAlign.swift
//  XenopompEssentials
//
//  Created by Александр on 16.12.2024.
//

import SwiftUI

public enum XAlignment {
    case left, center, right
}

public struct HorizontalAlign<Content: View>: View {
    var alignment: XAlignment
    @ViewBuilder let content: Content?

    public var body: some View {
        HStack(spacing: 0) {
            switch alignment {
                case .left:
                    content
                    Spacer()
                    
                case .center:
                    Spacer()
                    content
                    Spacer()
                    
                case .right:
                    Spacer()
                    content
            }
        }
    }
}

#Preview {
    VStack {
        HorizontalAlign(alignment: .left) {
            Text("Left")
        }
        
        HorizontalAlign(alignment: .center) {
            Text("Center")
        }
        
        HorizontalAlign(alignment: .right) {
            Text("Right")
        }
    }
    .shrink(at: .both)
}
