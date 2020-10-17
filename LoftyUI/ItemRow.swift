//
//  ItemRow.swift
//  LoftyUI
//
//  Created by Oliver Lippold on 03/10/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import SwiftUI

struct ItemRow: View {
    var item: Inventory
    
    var body: some View {
        NavigationLink(destination: EditItemView(item: item)) {
            HStack {
                Image(uiImage: UIImage(data: item.image ?? Data())!)
                    .resizable()
                .scaledToFit()
                    .frame(width: 80, height: 50)
                    //.frame(maxHeight: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 24, style: .continuous))
                /*.frame(width: 80, height: 50)
                    .clipShape(Circle())
                    .overlay(Circle().stroke(Color.gray, lineWidth: 2)) */
                
                VStack(alignment: .leading) {
                    Text(item.itemName)
                        .font(.headline)
                    Text(item.itemDescription)
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Inventory.example)
    }
}
