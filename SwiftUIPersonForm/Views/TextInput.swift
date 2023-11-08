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
    
    init(topText: String, fieldText: Binding<String>, keyboardType: UIKeyboardType) {
        self.topText = topText
        self._fieldText = fieldText
        self.keyboardType = keyboardType
    }
    
    init(topText: String, fieldText: Binding<String>, keyboardType: UIKeyboardType, @ViewBuilder rightContent: @escaping () -> AnyView) {
        self.topText = topText
        self._fieldText = fieldText
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
                    .keyboardType(/*@START_MENU_TOKEN@*/.default/*@END_MENU_TOKEN@*/)
                    .font(Font.sfPro(type: .medium, size: 18))
                    .foregroundColor(Colors.humanBlack)
                AnyView(rightContent?())
            }
            .padding(.horizontal, 24)

            .frame(height: 64)
            .background(
                RoundedRectangle(cornerRadius: 30)
                    .fill(Colors.lGray)
            )
        }.padding(.bottom, 24)
    }
}
