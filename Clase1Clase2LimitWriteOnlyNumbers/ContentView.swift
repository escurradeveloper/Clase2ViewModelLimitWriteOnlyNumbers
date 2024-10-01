//
//  ContentView.swift
//  Clase1Clase2LimitWriteOnlyNumbers
//
//  Created by Escurra Colquis on 27/09/24.
//

import SwiftUI
import Combine

struct ContentView: View {
    @StateObject var viewModel: ContentViewModel = ContentViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Rectangle()
                    .fill(Color(.systemGray6))
                    .clipShape(.rect(cornerRadius: 20))
                    .frame(minWidth: 0, maxWidth: .infinity, maxHeight: 50)
                    .padding([.leading, .trailing], 20)
                    .overlay(
                        TextField("Escribe tu número celular", text: $viewModel.phone)
                            .keyboardType(.numberPad)
                            .foregroundStyle(.black)
                            .padding([.trailing, .leading], 35)
                            .onReceive(Just(viewModel.phone)) { newValue in
                                viewModel.limitPhone(viewModel.limit, newValue: newValue)
                            }
                    )
                Spacer()
            }
            .navigationTitle("Limitar solo números")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    ContentView()
}
