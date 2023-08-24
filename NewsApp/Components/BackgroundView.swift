//
//  BackgroundView.swift
//  NewsApp
//
//  Created by Can Behran Kankul on 16.08.2023.
//

import SwiftUI

struct BackgroundView: View {
        
    var body: some View {
        ZStack {
            Color.viewBackground.edgesIgnoringSafeArea(.all)
        }
    }
}

struct BackgroundView_Previews: PreviewProvider {
    static var previews: some View {
        BackgroundView()
    }
}
