//
//  Model.swift
//  GameStream
//
//  Created by Anthony Rubio on 20/07/24.
//

import SwiftUI

struct Games: Codable, Hashable {
    let games: [GameElement]
}

struct GameElement: Codable, Hashable {
    let title, studio, contentRaiting, publicationYear: String
    let description: String
    let platforms, tags: [String]
    let videosUrls: VideosUrls
    let galleryImages: [String]
}

struct VideosUrls: Codable, Hashable {
    let mobile, tablet: String
}
