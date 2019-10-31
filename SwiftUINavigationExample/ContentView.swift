//
//  ContentView.swift
//  SwiftUINavigationExample
//
//  Created by Gualtiero Frigerio on 24/07/2019.
//  Copyright © 2019 Gualtiero Frigerio. All rights reserved.
//

import SwiftUI

struct MyModal: View {
    
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            Text("Hi I'm a modal")
            Button(action: {
                self.presentationMode.wrappedValue.dismiss()
            }) {
                Text("Dismiss me")
            }
        }.onAppear {
            print("presentationMode = \(self.presentationMode)")
        }
    }
}

struct EmptyView: View {
    var body: some View {
        Spacer()
    }
}

struct ContentView: View {
    @EnvironmentObject var coordinator:Coordinator
    @State var showModal = false
    @State var tag:Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination:coordinator.getListOfCategories()) {
                    Text("Show categories")
                }
                Button(action: {
                    self.showModal = true
                }, label: {
                    Text("show modal")
                })
                Button(action: {
                    self.tag = 1
                }, label: {
                    Text("show modal tag 1")
                })
                NavigationLink(destination: MyModal()) {
                    Text("push modal")
                }
                NavigationLink(destination: MyModal(), isActive: $showModal) {
                    EmptyView()
                }
                NavigationLink(destination: MyModal(), tag: 1, selection: $tag) {
                    EmptyView()
                }
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
