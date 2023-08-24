//
//  AppLabel.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 22.08.2023.
//

import SwiftUI

enum TextAlignment {
    case left, middle, right
}

struct AppLabel: View {
    var text: String
    var font: FontType
    var size: CGFloat
    var alignment: TextAlignment = .left
    
    var body: some View {
        
        if alignment == .left {
            HStack{
                Text(text)
                    .font(Font.custom(font.fontName,
                                      size: size)).lineSpacing(0)
                Spacer()
            }
        } else if alignment == .middle {
            HStack {
                Spacer()
                Text(text)
                    .font(Font.custom(font.fontName,
                                      size: size)).lineSpacing(0)
                Spacer()
            }
        } else {
            HStack {
                Spacer()
                Text(text)
                    .font(Font.custom(font.fontName,
                                      size: size)).lineSpacing(0)
            } 
        }
    }
}

struct AppLabel_Previews: PreviewProvider {
    static var previews: some View {
        AppLabel(text: "Hello World!", font: .regular, size: 14)
    }
}
