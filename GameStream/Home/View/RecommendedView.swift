//
//  RecommendedView.swift
//  GameStream
//
//  Created by Anthony Rubio on 21/07/24.
//

import SwiftUI

struct RecommendedView: View {
    var recommended: [GameElement]

    var body: some View {
        VStack(alignment: .leading) {
            TextTitleHome(description: "RECOMENDADO PARA TI")
                .padding(.leading, 5)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(recommended, id: \.self) {
                        game in RecommendedItem(itemGame: game)
                    }
                }
            }
        }
    }
}

struct RecommendedItem: View {
    var itemGame: GameElement
    var body: some View {
        let networkImage = URL(string: itemGame.galleryImages.first ?? "")!
        let videoURL = URL(string: itemGame.videosUrls.mobile)!
        NavigationLink(destination: VideoPlayerView(videoURL: videoURL)) {
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
            }.frame(
                width: UIScreen.main.bounds.width * 0.7,
                height: 160
            )
        }
    }
}
