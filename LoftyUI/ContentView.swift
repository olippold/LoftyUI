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
                    .onDelete(perform: deleteItem)
                }
                    /* VStack {
                     Spacer()
                     HStack {
                     Spacer()
                     Button(action: { self.showingDetailView = true },
                     label:
                     //{ Image(systemName: "plus.circle.fill")}
                     { Text("+")
                     .font(.system(.largeTitle))
                     .frame(width: 77, height: 70)
                     .foregroundColor(Color.white)
                     .padding(.bottom, 7)
                     })
                     .background(Color.blue)
                     .cornerRadius(38.5)
                     .padding()
                     .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
                     }
                     } */
                    .navigationBarTitle("Lofty")
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
