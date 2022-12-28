//
//  PopupItem.swift
//  
//
//  Created by vdotup on 28/12/2022.
//

import SwiftUI

public struct PopupItem: Equatable {
    public static func == (lhs: PopupItem, rhs: PopupItem) -> Bool {
        lhs.id == rhs.id
    }

    let id = UUID()
    let destination: AnyView
    let transition: AnyTransition
    let dimColor: Color
    let outsideDismiss: Bool
}
