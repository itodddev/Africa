//
//  ContentView.swift
//  Africa
//
//  Created by Todd James on 7/6/22.
//

import SwiftUI

struct ContentView: View {
  let animals: [Animal] = Bundle.main.decode("animals.json")

  var body: some View {
    NavigationView {
      List {
        CoverImageView()
          .frame(height: 300) // scaleToFill() will fill the frame
          .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0))

        ForEach(animals) { animal in
          NavigationLink(destination: AnimalDetailView(animal: animal)) {
            AnimalListItemView(animal: animal)
          }
        }
      }
      .navigationBarTitle("Africa", displayMode: .large)
    }
    .navigationViewStyle(.stack)
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
