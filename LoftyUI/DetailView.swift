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
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Item Name", text: $itemName)
                TextField("Description", text: $itemDescription)
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    Text("Tap to select a picture")
                        .foregroundColor(.white)
                        .font(.headline)
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                
            }
            .navigationBarTitle("Add new item")
            .navigationBarItems(trailing: Button("Save") {
                let newItem = Inventory(context: self.moc)
                newItem.itemName = self.itemName
                newItem.itemDescription = self.itemDescription
                try? self.moc.save()
                self.presentationMode.wrappedValue.dismiss()
            })
                .sheet(isPresented: $showingImagePicker) {
                    ImagePicker(image: self.$inputImage)
            }
        }
    }
}

struct DetailView_Previews: PreviewProvider {
    static var previews: some View {
        DetailView()
    }
}
