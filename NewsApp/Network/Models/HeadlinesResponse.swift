//
//  HeadlinesResponse.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 23.08.2023.
//

import Foundation
import SwiftUI

struct HeadlinesResponse: Codable {
    let status: String?
    let totalResults: Int?
    let articles: [Article]?
}

// MARK: - Article
struct Article: Codable {

    let source: Source?
    let author: String?
    let title: String?
    let description: String?
    let url: String?
    let urlToImage: String?
    let publishedAt: String?
    let content: String?
    
    func getImageUrlFor(_ width: CGFloat) -> URL? {
        
        let urlComponents = urlToImage?.split(separator: "?")
        let resizedImageUrl = urlComponents?.first?.appending("?resize=\(width),\(120)")
    
        return URL(string: resizedImageUrl ?? "https://techcrunch.com/wp-content/uploads/2019/05/GettyImages-1024463070.jpg?resize=\(width),\(120)")
    }
}

// MARK: - Source
struct Source: Codable {
    let id: String?
    let name: String?
}

extension Article: Identifiable {
    var id: UUID { return UUID() }
}
