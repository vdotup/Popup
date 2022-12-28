//
//  View+.swift
//  
//
//  Created by vdotup on 28/12/2022.
//

import SwiftUI

public extension View {
    func popup() -> some View {
        ZStack {
            self
            PopupView()
        }
    }
}
