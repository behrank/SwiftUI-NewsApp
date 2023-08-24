//
//  AppTextField.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 22.08.2023.
//

import SwiftUI

struct AppTextField: View {
    
    @Binding var value: String
    var placeholder: String = ""
    
    var body: some View {
        TextField(placeholder, text: $value)
            .font(Font.custom(FontType.regular.fontName,
                              size: 14))
            .onAppear {
                UITextField.appearance().clearButtonMode = .whileEditing
            }
    }
}

struct AppTextField_Previews: PreviewProvider {
    static var previews: some View {
        AppTextField(value: Binding.constant(""), placeholder: "placeholder")
    }
}
