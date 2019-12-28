//
//  ContentView.swift
//  LoftyUI
//
//  Created by Oliver Lippold on 28/12/2019.
//  Copyright © 2019 Oliver Lippold. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(entity: Inventory.entity(), sortDescriptors: []) var loftItems: FetchedResults<Inventory>
    @State private var showingDetailView = false
    
    var body: some View {
       NavigationView {
           //Text("\(loftItems.count)")
           
           List {
               ForEach(loftItems, id: \.self) { item in
                   NavigationLink(destination: Text(item.itemName ?? "Unknown Item")) {
                       HStack {
                           VStack(alignment: .leading) {
                               Text(item.itemName ?? "Unknown Item")
                                   .font(.headline)
                               Text(item.itemDescription ?? "Unknown Description")
                           }
                       }
                   }
                   
               }
               .onDelete(perform: removeRows)
           }
           .navigationBarItems(
               leading: EditButton(),
               trailing: Button(action: {
                   self.showingDetailView = true
               }) {
                   Image(systemName: "plus")
           })
       }
       .sheet(isPresented: $showingDetailView) {
        DetailView().environment(\.managedObjectContext, self.moc)
       }
    }
    
    func removeRows(at offsets: IndexSet) {
        // todo:
        //loftItems.items.remove(atOffsets: offsets)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
