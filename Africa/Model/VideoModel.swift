//
//  VideoModel.swift
//  Africa
//
//  Created by Todd James on 7/8/22.
//

import Foundation

struct Video: Codable, Identifiable {
  let id: String
  let name: String
  let headline: String

  // Computed property
  var thumbnail: String {
    return "video-\(id)"
  }
}
