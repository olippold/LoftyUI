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
                VStack(alignment: .leading) {
                    Text(item.itemName)
                        .font(.headline)
                    Text(item.itemDescription)
                    //Image(data: item.image)
                    Image(uiImage: UIImage(data: item.image ?? Data())!)
                        .resizable()
                    .scaledToFit()
                        .frame(width: 80, height: 50)
                    
                }
            }
        }
    }
}

struct ItemRow_Previews: PreviewProvider {
    static var previews: some View {
        ItemRow(item: Inventory())
    }
}
