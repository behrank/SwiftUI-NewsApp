//
//  Fonts.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 22.08.2023.
//

import Foundation

enum FontType {
    case black
    case blackItalic
    case bold
    case boldItalic
    case mediumItalic
    case medium
    case regular
    case italic
    case light
    case lightItalic
    case thin
    
    var fontName: String {
        switch self {
        case .black:        return "Roboto-Black"
        case .blackItalic:  return "Roboto-BlackItalic"
        case .bold:         return "Roboto-Bold"
        case .boldItalic:   return "Roboto-BoldItalic"
        case .medium:       return "Roboto-Medium"
        case .mediumItalic: return "Roboto-MediumItalic"
        case .regular:      return "Roboto-Regular"
        case .italic:       return "Roboto-Italic"
        case .light:        return "Roboto-Light"
        case .lightItalic:  return "Roboto-LightItalic"
        case .thin:         return "Roboto-Thin"
        }
    }
}
