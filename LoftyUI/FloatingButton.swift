//
//  FloatingButton.swift
//  LoftyUI
//
//  Created by Oliver Lippold on 23/05/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import SwiftUI

struct FloatingButton: View {
    let buttonText: String
    @Binding var buttonWasPressed: Bool
    
    var body: some View {
        VStack {
            Spacer()
            HStack {
                Spacer()
                Button(action: { self.buttonWasPressed = true
                },
                       label:
                    { Text(buttonText)
                        .font(.system(.largeTitle))
                        .frame(width: 77, height: 70)
                        .foregroundColor(Color.white)
                        .padding(.bottom, 7)
                }
                )
                    .background(Color.blue)
                    .cornerRadius(38.5)
                    .padding()
                    .shadow(color: Color.black.opacity(0.3), radius: 3, x: 3, y: 3)
            }
        }
    }
}

struct FloatingButton_Previews: PreviewProvider {
    static var previews: some View {
        FloatingButton(buttonText: "+", buttonWasPressed: Binding.constant(false))
    }
}
