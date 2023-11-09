//
//  TextInput.swift
//  SwiftUIPersonForm
//
//  Created by andrey perevedniuk on 08.11.2023.
//

import Foundation
import SwiftUI

struct TextInput: View {
    let topText: String
    let keyboardType: UIKeyboardType
    var rightContent: (() -> AnyView)? = nil
    
    @Binding var fieldText: String
    @Binding var isValidInput: Bool
    
    init(topText: String, fieldText: Binding<String>, keyboardType: UIKeyboardType, isValidInput: Binding<Bool>) {
        self.topText = topText
        self._fieldText = fieldText
        self._isValidInput = isValidInput
        self.keyboardType = keyboardType
    }
    
    init(
        topText: String,
        fieldText: Binding<String>,
        keyboardType: UIKeyboardType,
        isValidInput: Binding<Bool>,
        @ViewBuilder rightContent: @escaping () -> AnyView
    ) {
        self.topText = topText
        self._fieldText = fieldText
        self._isValidInput = isValidInput
        self.rightContent = rightContent
        self.keyboardType = keyboardType
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(topText)
                .font(Font.sfPro(type: .regular, size: 16))
                .padding(.horizontal, 24)
            
            HStack {
                TextField("", text: $fieldText)
                .autocorrectionDisabled()
                .keyboardType(keyboardType)
                .font(Font.sfPro(type: .medium, size: 18))
                .foregroundColor(Colors.humanBlack)
                AnyView(rightContent?())
            }
            .padding(.horizontal, 24)
            .frame(height: 64)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Colors.lGray)
                    .strokeBorder(isValidInput ? Colors.lGray : .red, lineWidth: 1)
            )
        }.padding(.bottom, 24)
    }
}
