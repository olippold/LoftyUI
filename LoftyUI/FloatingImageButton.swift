//
//  FloatingImageButton.swift
//  LoftyUI
//
//  Created by Oliver Lippold on 23/05/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import SwiftUI

struct FloatingImageButton: View {
    //let buttonText: String
    let buttonImage: String
    @Binding var buttonWasPressed: Bool
    
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: { self.buttonWasPressed = true
                },
                       label:
                    { Image(systemName: buttonImage)
                        .resizable()
                        .frame(width: 77, height: 70)
                        .foregroundColor(Color.blue)
                        .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
                        
                }
                )
                    .padding()
            }
        }
    }
}

struct FloatingImageButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingImageButton(buttonImage: "plus.circle.fill", buttonWasPressed: Binding.constant(false))
    }
}
