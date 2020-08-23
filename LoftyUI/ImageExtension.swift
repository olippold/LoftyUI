//
//  ImageExtension.swift
//  LoftyUI
//
//  Created by Oliver Lippold on 23/08/2020.
//  Copyright © 2020 Oliver Lippold. All rights reserved.
//

import Foundation
import SwiftUI

extension Image {
    
    public init?(data: Data?) {
        guard let data = data,
            let uiImage = UIImage(data: data) else {
                return nil //Image(uiImage: UIImage(data: Data())!)
        }
        self = Image(uiImage: uiImage)
    }
}
