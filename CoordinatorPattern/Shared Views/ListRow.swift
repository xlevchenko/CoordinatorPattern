//
//  ListRow.swift
//  CordinatorPattern
//
//  Created by Olexsii Levchenko on 02.11.2025.
//

import SwiftUI

struct ListRow: View {
    
    var title: String
    var trailingText: String?
    var systemImageName: String?
    
    var showTrailingChevron = false
    var action: (()->Void)? = nil
    
    var body: some View {
        VStack {
            HStack {
                if let systemImageName {
                    Image(systemName: systemImageName)
                        .frame(width: 20)
                }
                Text(title)
                Spacer()
                if let trailingText {
                    Text(verbatim: trailingText)
                }
                
                if showTrailingChevron {
                    Image(systemName: "chevron.right")
                }
            }
            .padding(.trailing, 20)
            
            Rectangle()
                .foregroundStyle(.gray.opacity(0.5))
                .frame(height: 1)
        }
        .contentShape(.rect)
        .onTapGesture {
            action?()
        }
        .padding(.leading, 20)
        .padding(.top, 5)
    }
}

#Preview {
    ListRow(title: "Email", trailingText: "realcarter50@gmail.com")
}
