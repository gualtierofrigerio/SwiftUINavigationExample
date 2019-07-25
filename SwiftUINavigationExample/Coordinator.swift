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

class Coordinator: BindableObject {
    
    var willChange = PassthroughSubject<Void, Never>()
    
    let dataSource = DataSource()
    let viewsFactory:ViewsFactory
    
    init() {
        viewsFactory = ViewsFactory(dataSource: dataSource)
    }
    
//    func tapOnCategory(_ category:Category) {
//        viewsFactory.createQuestionsList(forCategory:category)
//    }
    
    func getListOfCategories() -> some View {
        return viewsFactory.categoriesList
    }
}

class ViewsFactory {
    
    let dataSource:DataSource
    var categoriesList:CategoriesList
    
//    var questionsList = DynamicNavigationDestinationLink(id:\Category.title.self) { category in
//         QuestionsList(questions:category.questions)
//    }
    
    init(dataSource:DataSource) {
        self.dataSource = dataSource
        print("create categories list")
        self.categoriesList = CategoriesList(dataSource: dataSource)
    }
    
//    func createQuestionsList(forCategory category:Category) {
//        self.questionsList.presentedData?.value = category
//    }
}
