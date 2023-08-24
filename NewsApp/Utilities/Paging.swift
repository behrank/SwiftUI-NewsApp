//
//  Paging.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 24.08.2023.
//

import Foundation

enum PagingState: Int, Equatable {
    case loadingFirstPage = 0
    case loaded = 1
    case loadingNextPage = 2
}
