//
//  ContentView.swift
//  SwiftUIPersonForm
//
//  Created by andrey perevedniuk on 08.11.2023.
//

import SwiftUI

struct PersonForm: View {
    @StateObject private var viewModel = PersonFormViewModel()
    
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
                    headerView
                    
                    dottedLine
                    
                    TextInput(
                        topText: "Nume Prenume:",
                        fieldText: $viewModel.nameText,
                        keyboardType: .alphabet,
                        isValidInput: $viewModel.isValidName,
                        rightContent: { AnyView(profileImage) }
                    )
                    .padding(.horizontal, 12)
                    
                    TextInput(
                        topText: "IDNP:",
                        fieldText: $viewModel.idnpText,
                        keyboardType: .decimalPad,
                        isValidInput: $viewModel.isValidIdnp,
                        rightContent: {
                            AnyView(
                                Button {
                                    viewModel.fillIdnp()
                                } label: {
                                    profileImage
                                }
                            )
                        }
                    )
                    .padding(.horizontal, 12)
                    
                
                    RadioButtonGroup(items: viewModel.personTypes.map({$0.rawValue})) { index in
                        viewModel.selectedPersonType = viewModel.personTypes[index]
                    }
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Colors.lGray)
                            .strokeBorder(viewModel.isValidPersonType ? Colors.lGray : .red, lineWidth: 1)
                    )
                    .padding(.horizontal, 12)
                    .padding(.bottom, 24)
                    

                    TextInput(
                        topText: "Adresa imobilului (în chirie):",
                        fieldText: $viewModel.adressText,
                        keyboardType: .alphabet,
                        isValidInput: $viewModel.isValidAdress
                    )
                    .padding(.horizontal, 12)
                  
                    TextInput(
                        topText: "Suma impozitului:",
                        fieldText: $viewModel.amountText,
                        keyboardType: .decimalPad,
                        isValidInput: $viewModel.isValidAmount
                    ) {
                        AnyView(Text("MDL"))
                    }
                    .padding(.horizontal, 12)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .background(Colors.humanWhite)
                .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                
                Button {
                    viewModel.onPressPayNow()
                } label: {
                    HStack {
                        Text("Plătește acum")
                            .foregroundColor(.white)
                            .font(Font.sfPro(type: .regular, size: 18))
                        Image(systemName: "arrow.forward")
                            .foregroundColor(.white)
                    }
                    .padding(.horizontal, 26)
                    .padding(.vertical, 20)
                    .background(viewModel.isValidAllData ? Colors.humanBlack : Colors.humanBlack.opacity(0.5))
                    .clipShape(RoundedRectangle(cornerRadius: 30, style: .continuous))
                }
                .padding(.top, 24)
                .disabled(!viewModel.isValidAllData)
                .alert("Successfull fill data", isPresented: $viewModel.showSuccessfullAlert) {
                    Button("OK", role: .cancel) { }
                }

            }
            .onTapGesture {
                hideKeyboard()
            }
        }
        .background(Colors.paymentSecondary)
    }
    
    private func hideKeyboard() {
        let resign = #selector(UIResponder.resignFirstResponder)
        UIApplication.shared.sendAction(resign, to: nil, from: nil, for: nil)
    }
}

private extension PersonForm {
    var headerView: some View {
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
    }
    
    var dottedLine: some View {
        Line()
            .stroke(style: StrokeStyle(lineWidth: 4, lineCap: .round, dash: [2, 8]))
            .foregroundStyle(Colors.paymentMiddle)
            .padding(.bottom, 12)
    }
    
    var profileImage: some View {
        Image("profileLogo")
            .resizable()
            .frame(width: 28, height: 28)
    }
}

#Preview {
    PersonForm()
}
