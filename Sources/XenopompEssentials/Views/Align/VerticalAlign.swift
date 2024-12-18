//
//  VerticalAlign.swift
//  XenopompEssentials
//
//  Created by Александр on 16.12.2024.
//

import SwiftUI

public enum YAlignment {
    case top, center, bottom
}

public struct VerticalAlign<Content: View>: View {
    var alignment: YAlignment
    var content: Content?
    
    public init(
        alignment: YAlignment, content: (() -> Content)?
    ) {
        self.alignment = alignment
        self.content = nil
        
        if let content = content {
            self.content = content()
        }
    }

    public var body: some View {
        VStack(spacing: 0) {
            switch alignment {
            case .top:
                content
                Spacer()
                
            case .center:
                Spacer()
                content
                Spacer()
                
            case .bottom:
                Spacer()
                content
            }
        }
    }
}

#Preview {
    HStack {
        VerticalAlign(alignment: .top) {
            Text("Top")
        }
        
        VerticalAlign(alignment: .center) {
            Text("Center")
        }
        
        VerticalAlign(alignment: .bottom) {
            Text("Bottom")
        }
    }
    .shrink(at: .both)
}
