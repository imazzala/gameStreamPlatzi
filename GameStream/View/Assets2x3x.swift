//
//  Assets2x3x.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 18/11/2021.
//

import SwiftUI

struct Assets2x3x: View {
    var body: some View {
        
        Image("platzi")
        
    }
}

struct Assets2x3x_Previews: PreviewProvider {
    static var previews: some View {
        Assets2x3x()
        Assets2x3x()
            .previewDevice("iPhone 13 Pro")
        Assets2x3x()
            .previewDevice("iPad Pro (11-inch) (3rd generation)")
    }
}
