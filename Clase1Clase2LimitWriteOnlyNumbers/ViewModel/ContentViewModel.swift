//
//  ContentViewModel.swift
//  Clase1Clase2LimitWriteOnlyNumbers
//
//  Created by Escurra Colquis on 27/09/24.
//

import Foundation

class ContentViewModel: ObservableObject {
    @Published var phone: String = ""
    let limit: Int = 9
    
    func limitPhone(_ limit: Int, newValue: String) {
        let numbers = "0123456789"
        if phone.count > limit {
            phone = String(phone.prefix(limit))
        }
        
        let filtered = newValue.filter { numbers.contains($0) }
        if filtered != newValue {
            phone = filtered
        }
    }
}
