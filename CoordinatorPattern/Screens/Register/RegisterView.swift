//
//  RegisterView.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import SwiftUI

struct RegisterView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Spacer()
            
            EmailField(value: $viewModel.email)
                .padding(.bottom, 10)
            PasswordField(value: $viewModel.password)
                .padding(.bottom, 10)
            PasswordField(value: $viewModel.congigurationPassword, placeholder: "Confirm Password")
                .padding(.bottom, 10)
            Button("Register") {
                viewModel.onRegisterTapped()
            }
            Spacer()
            Button("Login") {
                viewModel.onLoginTapped()
            }
        }
        .padding(.horizontal, 50)
        .alert(viewModel.alertTitle, isPresented: $viewModel.showAlert) {
            Button("OK" , role: .none) {
                if viewModel.registrationSeccessfull {
                    viewModel.onRegisterComplete()
                }
            }
        }
    }
}

#Preview {
    RegisterView(viewModel: .init())
}
