//
//  DashboardViewModel.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 23.08.2023.
//

import Foundation
import Combine

class DashboardViewModel: ViewModel {
    
    @Published var isLoadingActive: Bool = true
    @Published var articleData: [Article] = []
    
    @Published var searchedText: String = "" {
        didSet {
            searchedTextDidChange()
        }
    }
    
    private var totalNewsCount: Int = 0
    private var currentPageNumber: Int = 1
    private let threshold: Int = 40
    private var canLoadMorePages: Bool = true
    private var state: PagingState = .loadingFirstPage
    
    private func searchedTextDidChange() {
        
        if searchedText.count > 2 ||  searchedText.isEmpty{
            isLoadingActive = true
            currentPageNumber = 1
            canLoadMorePages = true
            state = .loadingFirstPage
            totalNewsCount = 0
            articleData = []
            fetchNewsFromAPI()
        }
    }
    
    func fetchNewsFromAPI() {
        
        state = currentPageNumber == 1 ? .loadingFirstPage : .loadingNextPage
        
        APIService.fetchHeadlines(pageNumber: currentPageNumber, searchText: searchedText)
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { err in
                debugPrint(err)
            }, receiveValue: { res in
                
                self.totalNewsCount = res.totalResults ?? 0
                
                if let data = res.articles {
                    self.articleData.append(contentsOf: data)
                    self.isLoadingActive = false
                }
                
                if self.articleData.count == self.totalNewsCount {
                    self.canLoadMorePages = false
                }
                self.state = .loaded
            })
            .store(in: &subscriptions)
    }
    
    func onNewsItemAppear(_ newsItem: Article) {
        if !canLoadMorePages {
            return
        }
        
        if state == .loadingNextPage || state == .loadingFirstPage {
            return
        }
        
        guard let index = articleData.firstIndex(where: { $0.id == newsItem.id }) else {
            return
        }

        let thresholdIndex = articleData.index(articleData.endIndex,
                                               offsetBy: -threshold)
        if index != thresholdIndex {
            return
        }

        state = .loadingNextPage
        currentPageNumber += 1
        
        fetchNewsFromAPI()
    }
}
