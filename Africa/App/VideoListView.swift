//
//  VideoListView.swift
//  Africa
//
//  Created by Todd James on 7/6/22.
//

import SwiftUI

struct VideoListView: View {
  @State var videos: [Video] = Bundle.main.decode("videos.json") // makes mutable soo videos can be shuffled
  let hapticImpact = UIImpactFeedbackGenerator(style: .medium) // for haptic feedback on shuffle button

  var body: some View {
    NavigationView {
      List {
        ForEach(videos) { item in
          NavigationLink(destination: VideoPlayerView(videoSelected: item.id, videoTitle: item.name)) {
            VideoListItemView(video: item)
              .padding(.vertical, 8)
          }
        }
      }
      .listStyle(InsetGroupedListStyle()) // adds gray background with corner radius adds some padding to side edges
      .navigationBarTitle("Videos", displayMode: .inline)
      .toolbar {
        ToolbarItem(placement: .navigationBarTrailing) {
          Button(action: {
            // Shuffle Videos
            videos.shuffle()
            hapticImpact.impactOccurred()
          }, label: {
            Image(systemName: "shuffle")
          })
        }
      }
    }
  }
}

struct VideoListView_Previews: PreviewProvider {
  static var previews: some View {
    VideoListView()
      .previewLayout(.sizeThatFits)
      .padding()
  }
}
