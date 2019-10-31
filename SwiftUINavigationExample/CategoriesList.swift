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
    @State var currentCategory:Int = 0
    
    var body: some View {
        List(dataSource.categories, id:\.title) { category in
            NavigationLink(destination: self.coordinator.getQuestionList(category)) {
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
