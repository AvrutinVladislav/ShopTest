//
//  CustomCornerView.swift
//  Magazine
//
//  Created by Vladislav Avrutin on 14.08.2024.
//

import SwiftUI

struct CustomCorner: Shape {
    var radius: CGFloat = 10
    var corners: UIRectCorner = .allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        return Path(path.cgPath)
    }
}
