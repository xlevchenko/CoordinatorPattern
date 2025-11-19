//
//  LoginView.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import SwiftUI

struct LoginView: View {
    
    @StateObject var viewModel: ViewModel
    
    
    var body: some View {
        VStack {
            Spacer()
            Text("Login")
                .padding(.bottom, 10)
            EmailField(value: $viewModel.email)
                .padding(.bottom, 10)
            PasswordField(value: $viewModel.password)
                .padding(.bottom, 10)
            
            Button("Submit") {
                viewModel.onSubmitTapped()
            }
            
            Spacer()
            
            Button("Register") {
                viewModel.onRegisterTapped()
            }
        }
        .padding(.horizontal, 50)
    }
}

#Preview {
    LoginView(viewModel: .init(userDefaults: .init()))
}
