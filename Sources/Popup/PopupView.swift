//
//  PopupView.swift
//  
//
//  Created by vdotup on 28/12/2022.
//

import SwiftUI

public struct PopupView: View {
    
    @ObservedObject private var manager = PopupManager.shared
    
    public var body: some View {
        ZStack(alignment: manager.alignment) {
            if let view = manager.activePopup {
                view.dimColor
                    .edgesIgnoringSafeArea(.all)
                    .onTapGesture {
                        if view.outsideDismiss {
                            manager.activePopup = nil
                        }
                    }

                ZStack {
                    view.destination
                }
                .frame(maxWidth: .infinity)
                .transition(view.transition)
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
        .edgesIgnoringSafeArea(.all)
        .animation(manager.animation, value: manager.activePopup)
    }
}
