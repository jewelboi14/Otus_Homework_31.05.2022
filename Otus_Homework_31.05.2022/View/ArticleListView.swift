//
//  ArticleListView.swift
//  Otus_Homework_31.05.2022
//
//  Created by Mikhail Yurov on 07.06.2022.
//

import SwiftUI

struct ArticleListView: View {
    
    //MARK: - Stored Properties
    
    @ObservedObject var viewModel = ArticleListViewModel()
    
    @State private var segmentedControlIndex = 0
    
    //MARK: - View Properties
    var body: some View {
        VStack {
            if let list = viewModel.articleList {
                List {
                    ForEach(list.articleList, id: \.id) { article in
                        Text(article.title ?? "")
                    }
                }
            }
        }
        .onAppear {
            viewModel.fetchArticleList()
        }
    }
}


struct ArticleListView_Previews: PreviewProvider {
    static var previews: some View {
        ArticleListView()
    }
}
