//
//  RadioGroup.swift
//  SwiftUIPersonForm
//
//  Created by andrey perevedniuk on 09.11.2023.
//

import SwiftUI

struct RadioButtonGroup: View {

    let items: [String]
    let callback: (Int) -> Void
    
    @State private var selectedIndex: Int? = nil

    var body: some View {
        VStack {
            ForEach(0..<items.count, id: \.self) { index in
                RadioButton(
                    index: index,
                    text: self.items[index],
                    isSelected: selectedIndex == index,
                    callback: self.radioGroupCallback
                ).padding(.horizontal, 24)
            }
        }
        .padding(.vertical, 12)
    }

    private func radioGroupCallback(index: Int) {
        selectedIndex = index
        callback(index)
    }
}

struct RadioButton: View {

    let index: Int
    let text: String
    let callback: (Int) -> Void
    let isSelected : Bool

    init(index: Int, text: String, isSelected: Bool, callback: @escaping (Int) -> Void) {
        self.index = index
        self.text = text
        self.isSelected = isSelected
        self.callback = callback
    }

    var body: some View {
        Button(action:{
            self.callback(index)
        }) {
            HStack(alignment: .center, spacing: 10) {
                Image(systemName: isSelected ? "checkmark.circle.fill" : "circle")
                    .resizable()
                    .frame(width: 20, height: 20)
                    .tint(Colors.humanBlack)
                Text(text)
                    .font(Font.sfPro())
                Spacer()
            }.foregroundColor(Colors.humanBlack)
        }
    }
}
