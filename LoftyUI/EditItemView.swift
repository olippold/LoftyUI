//
//  EditItemView.swift
//  LoftyUI
//
//  Created by Oliver Lippold on 19/09/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import SwiftUI

struct EditItemView: View {
    //@Environment(\.managedObjectContext) var moc
    @Environment(\.presentationMode) var presentationMode
    
    //@Binding var item: Inventory
    var item: Inventory
    //@State private var item: Inventory!
    /*@State private var itemName = ""
    @State private var itemDescription = ""
    @State private var showingImagePicker = false
    @State private var inputImage: UIImage?
    @State private var image: Image? */
    
    var body: some View {
        NavigationView {
            VStack {
                /*TextField("Item Name", text: item.itemName )
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding()
                TextField("Description", text: item.itemDescription)
                    .textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding() */
                Text(item.itemName)
                Text(item.itemDescription)
                 
                ZStack {
                    Rectangle()
                        .fill(Color.secondary)
                    
                    /*if image != nil {
                        image?
                            .resizable()
                            .scaledToFit()
                    } else {
                        Text("Tap to select a picture")
                            .foregroundColor(.white)
                            .font(.headline)
                    } */
                    
                }
                /*.onTapGesture {
                    self.showingImagePicker = true
                } */
                
            }
            .navigationBarTitle("Edit item")
            /*.navigationBarItems(
                leading: Button("Cancel") { self.presentationMode.wrappedValue.dismiss()},
                trailing:
                Button("Save") {
                    // todo: this will need to change!
                    let newItem = Inventory(context: self.moc)
                    newItem.itemName = self.itemName
                    newItem.itemDescription = self.itemDescription
                    
                    if let imageData = self.inputImage?.pngData() {
                        newItem.image = imageData
                    }
                    
                    try? self.moc.save()
                    self.presentationMode.wrappedValue.dismiss()
            }) */
                
                /*.sheet(isPresented: $showingImagePicker, onDismiss: loadImage) {
                    ImagePicker(image: self.$inputImage) */
            }
        }
        
    //}
    
    /*func loadImage()
    {
        guard let inputImage = inputImage else { return }
        image = Image(uiImage: inputImage)
    } */
}

/*struct EditItemView_Previews: PreviewProvider {
    static var previews: some View {
        EditItemView(item: Inventory())
    }
} */
 

