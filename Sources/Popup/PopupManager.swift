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
    @Published public var alignment: Alignment = .center
    @Published public var animation: Animation = .spring()
    
    @Published public var defaultTransition: AnyTransition = .opacity
    @Published public var defaultAlignment: Alignment = .center
    @Published public var defaultAnimation: Animation = .spring()
    @Published public var defaultDimColor: Color = .black.opacity(0.3)
    @Published public var defaultOutsideDismiss: Bool = true
    
    public func push(_ view: some View,
                     transition: AnyTransition? = nil,
                     alignment: Alignment? = nil,
                     animation: Animation? = nil,
                     dimColor: Color? = nil,
                     outsideDismiss: Bool? = nil
    ) {
        
        self.animation = animation ?? defaultAnimation
        self.alignment = alignment ?? defaultAlignment
        
        activePopup = .init(destination: AnyView(view),
                            transition: transition ?? defaultTransition,
                            animation: animation ?? defaultAnimation,
                            dimColor: dimColor ?? defaultDimColor,
                            outsideDismiss: outsideDismiss ?? defaultOutsideDismiss
        )
    }
    
    public func pop() {
        activePopup = nil
    }
}
