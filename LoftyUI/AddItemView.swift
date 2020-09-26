//
//  DetailView.swift
//  LoftyUI
//
//  Created by Oliver Lippold on 28/12/2019.
//  Copyright © 2019 Oliver Lippold. All rights reserved.
//

import SwiftUI

struct AddItemView: View {
    @Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    @State private var itemName = ""
    @State private var itemDescription = ""
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image?
    
    var body: some View {
        NavigationView {
            VStack {
                TextField("Item Name", text: $itemName)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Description", text: $itemDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                /*TextView(text: $itemDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    // .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .padding() */
                 
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    
                    if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    }
                    
                }
                .onTapGesture {
                    self.showingImagePicker = true
                }
                
            }
            .navigationBarTitle("Add new item")
            .navigationBarItems(
                leading: Button("Cancel") { self.presentationMode.wrappedValue.dismiss()},
                trailing:
                Button("Save") {
                    let newItem = Inventory(context: self.moc)
                    newItem.itemName = self.itemName
                    newItem.itemDescription = self.itemDescription
                    
                    //slet imageInstance = UIImage(context: self.moc)
                    //imageInstance.img =
                    
                    if let imageData = self.inputImage?.pngData() {
                        newItem.image = imageData
                    }
                    
                    try? self.moc.save()
                    self.presentationMode.wrappedValue.dismiss()
            })
                
                .sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$inputImage)
            }
        }
        
        
    }
    
    func loadImage()
    {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    }
}

struct AddItemView_Previews: PreviewProvider {
    static var previews: some View {
        AddItemView()
    }
}
