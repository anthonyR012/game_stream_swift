//
//  MayLikeYouView.swift
//  GameStream
//
//  Created by Anthony Rubio on 21/07/24.
//

import Foundation
import SwiftUI

struct MayLikedYouView: View {
    var mayLikeYou : GameElement
    var body: some View {
        VStack (alignment: .leading) {
            TextTitleHome(description: "VIDEOS QUE PODRíAN GUSTARTE")
                .padding(.leading, 5)
            ScrollView (.horizontal, showsIndicators: false) {
                MayLikedYouItemView(itemGame: mayLikeYou)
            }
        }
    }
}

struct MayLikedYouItemView : View{
    var itemGame : GameElement
    var body: some View {
        let networkImage = URL(string: itemGame.galleryImages.first ?? "")!
        let videoURL = URL(string: itemGame.videosUrls.mobile)!
        NavigationLink (destination: FullScreenVideoView(videoURL: videoURL)){
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


