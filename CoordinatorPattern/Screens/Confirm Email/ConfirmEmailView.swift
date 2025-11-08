//
//  ConfirmEmailView.swift
//  CoordinatorPattern
//
//  Created by Olexsii Levchenko on 08.11.2025.
//

import SwiftUI

struct ConfirmEmailView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            Text("Confirm Email Address")
            
            TextField("", text: $viewModel.emailCode)
                .multilineTextAlignment(.center)
                .padding(.vertical, 5)
                .padding(.horizontal, 10)
                .background(Color(UIColor.systemGray6))
                .clipShape(.rect(cornerRadius: 10))
                .overlay {
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(.gray, lineWidth: 1)
                }
                .frame(width: 100)
            
            Button("Submit") {
                viewModel.onSubmitTapped()
            }
            .padding(.top, 30)
        }
        .navigationBarBackButtonHidden()
        .alert("Code Submitted", isPresented: $viewModel.showSubmittedAlert) {
            Button("OK", role: .none) {
                viewModel.onConfirmSubmit()
            }
        }
    }
}

#Preview {
    ConfirmEmailView(viewModel: .init())
}
