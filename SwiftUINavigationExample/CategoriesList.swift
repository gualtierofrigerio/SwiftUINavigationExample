//
//  CategoriesList.swift
//  SwiftUINavigationExample
//
//  Created by Gualtiero Frigerio on 24/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//


import SwiftUI

struct CategoryRow : View {
    var category:Category
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(category.title)
                .font(.title)
            Spacer()
            Text("\(category.questions.count) questions")
        }.padding()
    }
}

struct CategoriesList : View {
    var dataSource:DataSource
    @EnvironmentObject var coordinator:Coordinator
    
    var questionsList = DynamicNavigationDestinationLink(id:\Category.title.self) { category in
            QuestionsList(model:QuestionsListModel(category:category))
        }
    
    var body: some View {
        List(dataSource.categories, id:\.title) { category in
            Button(action: {
                self.questionsList.presentedData?.value = category
            }) {
               CategoryRow(category:category)
            }
        }
        .navigationBarTitle("Categories")
    }
}

struct CategoriesListAlt : View {
    var dataSource:DataSource
    @EnvironmentObject var coordinator:Coordinator
    
    var questionsList = DynamicNavigationDestinationLink(id:\Category.title.self) { category in
            QuestionsList(model:QuestionsListModel(category:category))
        }
    
    var body: some View {
        List(dataSource.categories, id:\.title) { category in
            Button(action: {
                DataSource.performLongOperationOnCategory(category) { result in
                    self.questionsList.presentedData?.value = result
                }
            }) {
               CategoryRow(category:category)
            }
        }
        .navigationBarTitle("Categories")
    }
}

#if DEBUG
struct CategoriesList_Previews : PreviewProvider {
    static var previews: some View {
        CategoriesList(dataSource: DataSource())
    }
}
#endif
