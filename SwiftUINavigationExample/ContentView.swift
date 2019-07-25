//
//  ContentView.swift
//  SwiftUINavigationExample
//
//  Created by Gualtiero Frigerio on 24/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var coordinator:Coordinator
    
    var body: some View {
        NavigationView {
            NavigationLink(destination:coordinator.getListOfCategories()) {
                Text("Show categories")
            }
        }
    }
}

#if DEBUG
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
#endif
