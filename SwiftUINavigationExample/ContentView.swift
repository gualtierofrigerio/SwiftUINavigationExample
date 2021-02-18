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

struct ContentView: View {
    @EnvironmentObject var coordinator:Coordinator
    @State var showModal = false
    @State var showView = false
    @State var tag:Int? = nil
    
    var body: some View {
        NavigationView {
            VStack {
                NavigationLink(destination:coordinator.getListOfCategories()) {
                    Text("Show categories")
                }
                Button(action: {
                    self.showView = true
                }, label: {
                    Text("show view")
                })
                Button(action: {
                    self.tag = 1
                }, label: {
                    Text("show view tag 1")
                })
                Button(action: {
                    self.showModal = true
                }, label : {
                    Text("show modal")
                })
                NavigationLink(destination: MyModal()) {
                    Text("push view")
                }
                NavigationLink(destination: MyModal(), isActive: $showView) {}
                NavigationLink(destination: MyModal(), tag: 1, selection: $tag) {}
            }
        }.sheet(isPresented: $showModal) {
            MyModal()
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
