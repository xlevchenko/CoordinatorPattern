//
//  MoreView.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import SwiftUI

struct MoreView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        ScrollView {
            VStack(spacing: 10) {
                ListRow(title: "Account", systemImageName: "person.crop.circle") {
                    viewModel.onAccountTapped()
                }
            }
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    MoreView(viewModel: .init())
}
