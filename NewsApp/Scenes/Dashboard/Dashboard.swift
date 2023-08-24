//
//  Dashboard.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 16.08.2023.
//

import SwiftUI

struct Dashboard: View {
    @ObservedObject var viewModel = DashboardViewModel()
    
    init() {
        UITableView.appearance().tableFooterView = UIView()
        UITableView.appearance().separatorStyle = .none
    }

    var body: some View {
        ZStack {
            BackgroundView()
            VStack{
                HeaderView(searchText: $viewModel.searchedText).padding(.bottom, 4)
                if viewModel.isLoadingActive {
                    Spacer()
                    ProgressView()
                    Spacer()
                } else {
                    List(viewModel.articleData, id: \.id) { article in
                        if #available(iOS 15.0, *) {
                            NewsItemView(article: article)
                                .onAppear {
                                    viewModel.onNewsItemAppear(article)
                                }
                                .listRowInsets(EdgeInsets())
                                .listRowSeparatorTint(.clear)
                        } else {
                            // Fallback on earlier versions
                            NewsItemView(article: article)
                                .onAppear {
                                    viewModel.onNewsItemAppear(article)
                                }
                                .listRowInsets(EdgeInsets())
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }.onAppear {

            viewModel.fetchNewsFromAPI()
        }
        
    }
}

struct Dashboard_Previews: PreviewProvider {
    static var previews: some View {
        Dashboard()
    }
}
