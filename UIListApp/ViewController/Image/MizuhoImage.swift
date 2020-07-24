//
//  CustomImageView.swift
//  UIListApp
//
//  Created by Kazuki on 2020/07/24.
//  Copyright © 2020 susu. All rights reserved.
//

import SwiftUI

struct CircleImage: View {
    var body: some View {
        VStack(alignment: .leading) {
            Image("mario")
                .padding(.leading, 500)
                .frame(width: 200, height: 200, alignment: .center)
                .clipShape(Circle())
                .overlay(
                    Circle().stroke(Color.white, lineWidth: 4))
                .shadow(radius: 10)
        }
    }
}

struct CircleImage_Previews: PreviewProvider {
    static var previews: some View {
        CircleImage()
    }
}
