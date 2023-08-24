//
//  APIService.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 23.08.2023.
//

import Foundation
import Combine

class APIService {
    static let shared = APIService()
    static private let apiKey = "519501c7238f42a8a69a4dbe08643d3f"
    static private var baseUrl: String = "https://newsapi.org/v2/"
    static private var baseQueryParams = ["apiKey": apiKey]
    
    static func fetchHeadlines(pageNumber: Int, searchText: String) -> AnyPublisher<HeadlinesResponse, Error> {
                
        var url = URL(string: baseUrl.appending("everything"))!
        url.withQuery(baseQueryParams)
        url.withQuery(["q" : searchText.isEmpty ? "usa" : searchText])
        url.withQuery(["pageSize" : "50"])
        url.withQuery(["page" : pageNumber.description])
        
        var request = URLRequest(url: url)
        request.httpMethod = "get"
        
        return URLSession.shared.dataTaskPublisher(for: request)
            .tryMap() { element -> Data in
                guard let httpResponse = element.response as? HTTPURLResponse,
                      httpResponse.statusCode == 200 else {
                    throw URLError(.badServerResponse)
                }
                debugPrint(String(bytes: element.data, encoding: .utf8) ?? "")
                return element.data
                
            }
            .decode(type: HeadlinesResponse.self, decoder: JSONDecoder())
            .eraseToAnyPublisher()
    }
    
    
}
