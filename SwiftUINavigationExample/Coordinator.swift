//
//  Coordinator.swift
//  SwiftUINavigationExample
//
//  Created by Gualtiero Frigerio on 24/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import Foundation
import Combine
import SwiftUI

enum Page {
    case home
    case list
    case detail
}

class Coordinator: ObservableObject {
    
    var willChange = PassthroughSubject<Void, Never>()
    
    let dataSource = DataSource()
    let viewsFactory:ViewsFactory
    
    init() {
        viewsFactory = ViewsFactory(dataSource: dataSource)
    }
    
    /*var list:NavigationLink<Category, String, QuestionsList>?
    
    var questionsList = NavigationLink(id:\Category.title.self) { category in
            QuestionsList(model:QuestionsListModel(category:category))
            }
    */
    func getListOfCategories() -> some View {
        return viewsFactory.categoriesList
    }
    
    func getQuestionList(_ category:Category) -> some View {
        QuestionsList(model:QuestionsListModel(category:category))
    }
    
    func getQuestionsForCategory(_ category:Category, callback: @escaping (([Question]) -> Void)) {
        _ = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: false) { _ in
            callback(category.questions)
        }
    }
}


class ViewsFactory {
    
    let dataSource:DataSource
    var categoriesList:CategoriesList
    
    init(dataSource:DataSource) {
        self.dataSource = dataSource
        print("create categories list")
        self.categoriesList = CategoriesList(dataSource: dataSource)
    }
}
