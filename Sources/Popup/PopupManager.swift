//
//  PopupManager.swift
//  
//
//  Created by vdotup on 28/12/2022.
//

import SwiftUI

public final class PopupManager: ObservableObject {
    
    public static let shared = PopupManager()
    
    @Published public var activePopup: PopupItem?
    @Published public var alignment: Alignment = .bottom
    @Published public var animation: Animation = .easeOut(duration: 0.2)
    
    @Published public var defaultDimColor: Color = .black.opacity(0.3)
    
    
    public func push(_ view: some View, edge: Edge = .bottom, dimColor: Color? = nil) {
        switch edge {
        case .top: alignment = .top
        case .leading: alignment = .leading
        case .bottom: alignment = .bottom
        case .trailing: alignment = .trailing
        }
        activePopup = .init(destination: AnyView(view),
                            transition: .move(edge: edge),
                            dimColor: dimColor ?? defaultDimColor
        )
    }
    
    public func pop() {
        activePopup = nil
    }
}
