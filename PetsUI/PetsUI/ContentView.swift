//
//  ContentView.swift
//  PetsUI
//
//  Created by Saavaj Studios on 30/12/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var vm = PetListViewModel(service: WebService())
    
    var body: some View {
        NavigationView{
            ScrollView{
                ForEach(vm.components,id: \.uniqueID){
                    component in
                    component.render()
                }
                .navigationTitle("Pet")
            }.task {
                await vm.load()
            }
        }
    }
}

#Preview {
    ContentView()
}
