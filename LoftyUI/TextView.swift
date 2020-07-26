//
//  TextView.swift
//  LoftyUI
//
//  Created by Oliver Lippold on 28/06/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import SwiftUI

struct TextView: UIViewRepresentable {
    @Binding var text: String
    
    func makeUIView(context: Context) -> UITextView {
        return UITextView()
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
    }
}
