//
//  GameView.swift
//  GameStream
//
//  Created by Anthony Rubio on 21/07/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel : HomeViewModel
    var body: some View {
        ZStack {
            Color("MainColor")
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    TextTitleGame(description: "Juegos")
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible())
                    ], spacing: 20) {
                        ForEach(viewModel.gamesInfo, id: \.self) { item in
                            let networkImage = URL(string: item.galleryImages.first ?? "")!
                            AsyncImage(url: networkImage) { image in
                                image
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipped()
                                    .shadow(radius: 10)
                                    .clipShape(RoundedRectangle(cornerRadius: 5))
                            } placeholder: {
                                ProgressView()
                                    .frame(width: 200, height: 200)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}

struct TextTitleGame: View {
    var description : String
    var fontSize: Font?
    var body: some View {
        Text(description)
            .font(fontSize ?? .title2)
            .bold()
            .padding(.top,20)
            .foregroundStyle(.white)
    }
}


