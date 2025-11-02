//
//  PasswordField.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 01.11.2025.
//

import SwiftUI

struct PasswordField: View {
    
    @Binding var value: String
    var placeholder: String = "Password"
    
    var body: some View {
        SecureField(placeholder, text: $value)
            .textFieldStyle(DefaultTextFieldStyle())
            .textInputAutocapitalization(.never)
    }
}

#Preview {
    PasswordField(value: .constant(""))
}
