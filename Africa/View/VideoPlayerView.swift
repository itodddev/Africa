//
//  VideoPlayerView.swift
//  Africa
//
//  Created by Todd James on 7/8/22.
//

import SwiftUI
import AVKit

struct VideoPlayerView: View {
  let videoSelected: String
  let videoTitle: String

  var body: some View {
    VStack {
      VideoPlayer(player: playVideo(fileName: videoSelected, fileFormat: "mp4")) {
        //Text(videoTitle)
      }
      .overlay(
        Image("logo")
          .resizable()
          .scaledToFit()
          .frame(width: 32, height: 32)
          .padding(.top, 6)
          .padding(.horizontal, 8)
        , alignment: .topLeading
      )
    }
    .accentColor(.accentColor)
    .navigationBarTitle(videoTitle, displayMode: .inline)
  }
}

struct VideoPlayerView_Previews: PreviewProvider {
  static let videos: [Video] = Bundle.main.decode("videos.json")

  static var previews: some View {
    NavigationView {
      VideoPlayerView(videoSelected: videos[0].id, videoTitle: videos[0].name)
    }
  }
}
