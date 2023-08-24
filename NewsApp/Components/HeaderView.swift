//
//  HeaderView.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 16.08.2023.
//

import SwiftUI

struct HeaderView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack {
            ZStack {
                Capsule()
                    .frame(maxWidth: .infinity,
                                maxHeight: 36)
                    .foregroundColor(Color.headerSearchBackground)
                HStack {
                    Image(systemName: "magnifyingglass")
                        .foregroundColor(Color.secondaryTextColor)
                    AppTextField(value: $searchText,
                                 placeholder: "Search")
                    .foregroundColor(Color.secondaryTextColor)
                }.padding(.leading, 8)
            }
            ZStack {
                Circle().background(Color.clear)
                Image(systemName: "person").foregroundColor(Color.secondaryTextColor)
            }
                .foregroundColor(Color.headerSearchBackground)
                .frame(width: 36, height: 36)
        }.padding(.leading, 16)
            .padding(.trailing, 16)
    }
}

struct HeaderView_Previews: PreviewProvider {
    static var previews: some View {
        HeaderView(searchText: Binding.constant(""))
    }
}
