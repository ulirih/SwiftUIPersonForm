//
//  Fonts.swift
//  SwiftUIPersonForm
//
//  Created by andrey perevedniuk on 08.11.2023.
//

import SwiftUI

enum FontType: String {
    case regular = "SFProDisplay-Regular"
    case medium = "SFProDisplay-Medium"
}

extension Font {
    static func sfPro(type: FontType = .regular, size: CGFloat = 20) -> Font {
        Font.custom(type.rawValue, size: size)
    }
}
