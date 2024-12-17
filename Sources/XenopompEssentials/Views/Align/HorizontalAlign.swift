//
//  HorizontalAlign.swift
//  XenopompEssentials
//
//  Created by Александр on 16.12.2024.
//

import SwiftUI

public enum XAlignment {
    case leading, center, trailing
}

public struct HorizontalAlign<Content: View>: View {
    var alignment: XAlignment
    var content: Content?
    
    public init(
        alignment: XAlignment, content: (() -> Content)?
    ) {
        self.alignment = alignment
        self.content = nil
        
        if let content = content {
            self.content = content()
        }
    }

    public var body: some View {
        HStack(spacing: 0) {
            switch alignment {
                case .leading:
                    content
                    Spacer()
                    
                case .center:
                    Spacer()
                    content
                    Spacer()
                    
                case .trailing:
                    Spacer()
                    content
            }
        }
    }
}

#Preview {
    VStack {
        HorizontalAlign(alignment: .leading) {
            Text("Leading")
        }
        
        HorizontalAlign(alignment: .center) {
            Text("Center")
        }
        
        HorizontalAlign(alignment: .trailing) {
            Text("Trailing")
        }
    }
    .shrink(at: .both)
}
