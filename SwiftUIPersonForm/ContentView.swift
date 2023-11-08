//
//  ContentView.swift
//  SwiftUIPersonForm
//
//  Created by andrey perevedniuk on 08.11.2023.
//

import SwiftUI

struct ContentView: View {
    @State var nameText: String = ""
    @State var idnpText: String = ""
    @State var adressText: String = ""
    @State var amountText: String = ""
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack() {
                Text("Impozit pe venit")
                    .font(Font.sfPro(type: .medium))
                    .tracking(2)
                    .foregroundColor(Colors.humanBlack)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(24)
                
                VStack {
                    HStack(alignment: .top) {
                        Image("emblem")
                            .resizable()
                            .frame(width: 48, height: 48)
                            .overlay(
                                RoundedRectangle(cornerRadius: 48/2)
                                    .stroke(.gray, lineWidth: 1)
                            )
                        VStack(alignment: .leading) {
                            Text("Impozitul pe venit pentru predarea în posesie și/sau folosință a imobilului".uppercased())
                                .font(Font.sfPro(type: .medium, size: 18))
                                .tracking(3)
                                .foregroundColor(Colors.humanBlack)
                            Text("Serviciul Fiscal de Stat")
                                .font(Font.sfPro(type: .regular, size: 14))
                                .padding(.top, 6)
                        }
                        .padding(.leading, 12)
                    }
                    .padding(EdgeInsets(top: 24, leading: 24, bottom: 12, trailing: 24))
                    
                    Line()
                        .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [2, 8]))
                        .foregroundStyle(Colors.paymentMiddle)
                        .padding(.bottom, 12)
                    
                    TextInput(
                        topText: "Nume Prenume:",
                        fieldText: $nameText,
                        keyboardType: .namePhonePad
                    )
                    .padding(.horizontal, 12)
                    
                    TextInput(
                        topText: "IDNP:",
                        fieldText: $idnpText,
                        keyboardType: .decimalPad
                    )
                    .padding(.horizontal, 12)
                    
                    
                    TextInput(
                        topText: "Adresa imobilului (în chirie):",
                        fieldText: $adressText,
                        keyboardType: .alphabet
                    )
                    .padding(.horizontal, 12)
                    
                    TextInput(
                        topText: "Suma impozitului:",
                        fieldText: $amountText,
                        keyboardType: .decimalPad
                    )
                    .padding(.horizontal, 12)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Colors.humanWhite)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                
                Button {
                    print("did press")
                } label: {
                    HStack {
                        Text("Plătește acum")
                            .foregroundColor(.white)
                            .font(Font.sfPro(type: .regular, size: 18))
                        Image(systemName: "arrow.forward")
                            .tint(.white)
                    }
                    .padding(.horizontal, 26)
                    .padding(.vertical, 20)
                    .background(Colors.humanBlack)
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                }.padding(.top, 24)

            }
        }
        .background(Colors.paymentSecondary)
    }
}

#Preview {
    ContentView()
}
