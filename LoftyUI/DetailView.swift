//
//  DetailView.swift
//  LoftyUI
//
//  Created by Oliver Lippold on 28/12/2019.
//  Copyright © 2019 Oliver Lippold. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var itemName = ""
    @State private var itemDescription = ""
    
    var body: some View {
        NavigationView {
            Form {
                TextField("Item Name", text: $itemName)
                TextField("Description", text: $itemDescription)
            }
            .navigationBarTitle("Add new item")
            .navigationBarItems(trailing: Button("Save") {
                let newItem = Inventory(context: self.moc)
                newItem.itemName = self.itemName
                newItem.itemDescription = self.itemDescription
                try? self.moc.save()
                self.presentationMode.wrappedValue.dismiss()
            })
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
