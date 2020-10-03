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
    @FetchRequest(entity: Inventory.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Inventory.itemName, ascending: true)
    ]) var loftItems: FetchedResults<Inventory>
    @State private var showingDetailView = false
    
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(loftItems, id: \.self) { item in
                        ItemRow(item: item)
                    }
                    .onDelete(perform: deleteItem)
                }
                //FloatingButton(buttonText: "+", buttonWasPressed: $showingDetailView)
                FloatingImageButton(buttonImage: "plus.circle.fill", buttonWasPressed: $showingDetailView)
                .navigationBarTitle("Lofty")
                .navigationBarItems(leading: EditButton())
                
            }
            .sheet(isPresented: $showingDetailView) {
                AddItemView().environment(\.managedObjectContext, self.moc)
            }
            
        }
    }
    
    func deleteItem(at offsets: IndexSet) {
        for offset in offsets {
            let item = loftItems[offset]
            moc.delete(item)
        }
        
        try? moc.save()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
