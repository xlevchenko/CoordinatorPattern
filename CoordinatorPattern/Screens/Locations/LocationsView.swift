//
//  LocationsView.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import SwiftUI

struct LocationsView: View {
    
    @StateObject var viewModel: ViewModel
    
    private let locations = [
        "Kyiv, Ukraine",
        "Paris, France",
        "Lviv, Ukraine",
        "Malyn, Ukraine",
        "Milan, Italy",
    ]
    
    var body: some View {
        ScrollView {
            VStack {
                ForEach(Array(locations.enumerated()), id: \.offset) { _, location in
                    ListRow(title: location)
                }
                Button("Your Account") {
                    viewModel.onYourAccountTapped()
                }
                .padding(.top, 10)
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    LocationsView(viewModel: .init())
}
