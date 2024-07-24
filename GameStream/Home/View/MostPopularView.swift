//
//  MostPopularView.swift
//  GameStream
//
//  Created by Anthony Rubio on 21/07/24.
//

import Foundation
import SwiftUI

struct MostPopularView: View {
    let mostPopular: GameElement
    var body: some View {
        VStack(alignment: .leading) {
            TextTitleHome(description: "LOS MÁS POPULARES")
                .padding(.leading, 5)
            ItemMostPopular(mostPopular: mostPopular)
        }
    }
}

struct ItemMostPopular: View {
    let mostPopular: GameElement
    var body: some View {
        let videoURL = URL(string: mostPopular.videosUrls.mobile)!
        let networkImage = URL(string: mostPopular.galleryImages.first ?? "")!
        NavigationLink(destination: VideoPlayerView(videoURL: videoURL)) {
            ZStack {
                Rectangle()
                    .clipShape(RoundedCorners(bottomLeft: 4, bottomRight: 4))
                AsyncImage(url: networkImage) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipped()
                        .shadow(radius: 10)
                } placeholder: {
                    ProgressView()
                        .frame(width: 200, height: 200)
                        .foregroundStyle(.white)
                }
                VStack {
                    Spacer()
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.white)
                    Spacer()
                    ZStack(alignment: .leading) {
                        Rectangle()
                            .clipShape(RoundedCorners(bottomLeft: 4, bottomRight: 4))
                            .foregroundStyle(.blueGray)
                        VStack {
                            Spacer()
                            TextTitleHome(description: mostPopular.title, fontSize: .title2)
                            Spacer()
                        }.padding(.leading, 15)
                    }
                    .frame(height: 70)
                }

            }.frame(height: 250)
        }.foregroundStyle(.white.opacity(0))
    }
}
