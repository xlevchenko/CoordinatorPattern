//
//  AccountView.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import SwiftUI

private enum Constants {
    static let avatarBackgroundSize: CGFloat = 70
    static var avatarSize: CGFloat { avatarBackgroundSize * 0.5 }
}

struct AccountView: View {
    
    @StateObject var viewModel: ViewModel
    
    var body: some View {
        VStack {
            ScrollView {
                VStack {
                    ZStack {
                        Circle()
                            .foregroundStyle(.gray.opacity(0.5))
                        Image(systemName: "person.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(
                                width: Constants.avatarSize,
                                height: Constants.avatarSize
                            )
                    }
                    .frame(
                        width: Constants.avatarBackgroundSize,
                        height: Constants.avatarBackgroundSize
                    )
                    
                    Text("Oleksii Levchenko")
                        .padding(.top, 20)
                    
                    Spacer()
                        .frame(height: 80)
                    ListRow(title: "Email", trailingText: "realcarter50@gmail.com")
                }
                .padding(.top, 20)
            }
            
            Button("Edit Account") {
                viewModel.onEditTapped()
            }
            .padding(.bottom, 20)
                     
            Button("Logout") {
                viewModel.onLogoutTapped()
            }
            .padding(.bottom, 20)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    AccountView(viewModel: .init())
}
