//
//  InsetGalleryView.swift
//  Africa
//
//  Created by Todd James on 7/7/22.
//

import SwiftUI

struct InsetGalleryView: View {
  let animal: Animal

  var body: some View {
    ScrollView(.horizontal, showsIndicators: false) {
      HStack(alignment: .center, spacing: 15) {
        ForEach(animal.gallery, id: \.self) { item in // got this wrong, id = name
          Image(item)
            .resizable()
            .scaledToFit()
            .frame(height: 200)
          .cornerRadius(12)
        }
      }
    }
  }
}

struct InsetGalleryView_Previews: PreviewProvider {

  static let animals: [Animal] = Bundle.main.decode("animals.json")

  static var previews: some View {
    InsetGalleryView(animal: animals[0])
      .previewLayout(.sizeThatFits)
      .padding()
  }
}