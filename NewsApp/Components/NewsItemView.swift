//
//  NewsItemView.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 22.08.2023.
//

import SwiftUI
import Kingfisher
struct NewsItemView: View {
    
    var article: Article?
    
    var body: some View {
        VStack {
            KFImage.url(article?.getImageUrlFor(150))
                .resizable()
                .placeholder({
                    RoundedRectangle(cornerRadius: 14).foregroundColor(Color.gray.opacity(0.1)).overlay(
                        ProgressView()
                    )
                })
                .cacheMemoryOnly()
                .fade(duration: 0.25)
                .onProgress { receivedSize, totalSize in  }
                .onSuccess { result in
                    print(result)
                }
                .onFailure { error in }
                .frame(height: 150)
                .cornerRadius(8)
            AppLabel(text: article?.source?.name?.uppercased() ?? "lorem ipsum",
                     font: .medium,
                     size: 10)
            .foregroundColor(Color.secondaryTextColor)
            .padding(.leading, 4)
            .padding(.trailing, 4)
            
            AppLabel(text: article?.title ?? "lorem ipsum",
                     font: .medium,
                     size: 16)
            .foregroundColor(Color.primaryTextColor)
            .padding(.leading, 4)
            .padding(.trailing, 4)
            .padding(.bottom, 4)
        }
        .background(
            Color.newsItemBackground.edgesIgnoringSafeArea(.all)
        )
        .cornerRadius(8)
        .padding(4)
    }
}

struct NewsItemView_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
