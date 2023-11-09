//
//  PersonFormViewModel.swift
//  SwiftUIPersonForm
//
//  Created by andrey perevedniuk on 09.11.2023.
//

import Foundation

enum PersonType: String {
    case phisical = "Fizica"
    case juridical = "Juridica"
}

final class PersonFormViewModel: ObservableObject {
    let personTypes: [PersonType] = [.phisical, .juridical]
    
    @Published var showSuccessfullAlert = false
    
    @Published var isValidName: Bool = false
    @Published var isValidIdnp: Bool = false
    @Published var isValidPersonType: Bool = false
    @Published var isValidAdress: Bool = false
    @Published var isValidAmount: Bool = false
    
    @Published var nameText: String = "" {
        didSet {
            if nameText.isEmpty || nameText.range(of: "^[a-zA-Z]*$", options: .regularExpression) == nil {
                isValidName = false
                return
            }
            isValidName = true
        }
    }
    
    @Published var idnpText: String = "" {
        didSet {
            if idnpText.starts(with: "0") || idnpText.count != 12 || idnpText.contains(".") {
                isValidIdnp = false
                return
            }
            isValidIdnp = true
        }
    }
    
    @Published var selectedPersonType: PersonType? = nil {
        didSet {
            isValidPersonType = selectedPersonType != nil
        }
    }
    
    @Published var adressText: String = "" {
        didSet {
            isValidAdress = !adressText.isEmpty
        }
    }
    
    @Published var amountText: String = "" {
        didSet {
            isValidAmount = !amountText.isEmpty && Double(amountText) != nil
        }
    }
    
    var isValidAllData: Bool {
        return isValidIdnp && isValidName && isValidAdress && isValidAmount && isValidPersonType
    }
    
    func fillIdnp() {
        idnpText = "223423459516"
    }
    
    func onPressPayNow() {
        guard isValidAllData else { return }
        showSuccessfullAlert = true
    }
}

