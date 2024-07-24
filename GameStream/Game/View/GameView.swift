//
//  GameView.swift
//  GameStream
//
//  Created by Anthony Rubio on 21/07/24.
//

import SwiftUI

struct GameView: View {
    @ObservedObject var viewModel: HomeViewModel
    var body: some View {
        ZStack {
            Color("MainColor")
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    TextTitleGame(description: "Juegos")
                    LazyVGrid(columns: [
                        GridItem(.flexible()),
                        GridItem(.flexible()),
                    ], spacing: 20) {
                        ForEach(viewModel.gamesInfo, id: \.self) { item in
                            ItemGameGrid(item: item)
                           
                        }
                    }
                    .padding()
                    Spacer()
                }
            }
        }
    }
}

struct DetailGameView : View {
    @Environment(\.presentationMode) var presentationMode
    let game : GameElement
    

    var body: some View {
        let networkImage = URL(string: game.galleryImages.first ?? "")!
        let videoURL = URL(string: game.videosUrls.mobile)!
        ZStack{
            Color(.blueGray)
            VStack (alignment: .leading) {
                HeaderVideoPlay(networkImage: networkImage,videoUrl: videoURL)
                HStack(alignment: .center) {
                    TextTitleGame(description: game.title,fontSize: .title)
                        .padding(.leading,15)
                        .frame(width: UIScreen.main.bounds.width * 0.6)
                        Spacer()
                    Image(systemName: "heart")
                        .resizable().frame(width: 20,height: 20)
                        .foregroundStyle(.white)
                        .padding(20)
                }
                VStack (alignment: .leading){
                    HStack (alignment: .top){
                        TextTitleGame(description: game.studio,fontSize: .callout)
                        TextTitleGame(description: game.contentRaiting,fontSize: .callout,isBold: false)
                        TextTitleGame(description: game.publicationYear,fontSize: .callout,isBold: false)
                    }
                    TextTitleGame(description: game.description,fontSize: .callout,isBold: false)
                    TextTitleGame(description: "GALERÍA",fontSize: .title3,isBold: false)
                    Spacer()
                }.padding()
               
            }
            
        }
        .navigationBarTitleDisplayMode(.inline)
        .navigationBarBackButtonHidden(true)
        .navigationBarItems(leading: Button(action: {
            self.presentationMode.wrappedValue.dismiss()
        }) {
            HStack {
                Image(systemName: "arrow.left")
            }.foregroundStyle(.white)
        })}

    
}

#Preview{
    DetailGameView(game:
                    GameElement(title: "The Witcher 3: Wild Hunt", studio: "CD Project Red", contentRaiting: "M", publicationYear: "2015", description: "As war rages on throughout the Northern Realms, you take on the greatest contract of your life — tracking down the Child of Prophecy, a living weapon that can alter the shape of the world.", platforms: ["PC", "Playstation 4", "Xbox One"], tags: ["RPG", "Action", "Open World"], videosUrls: GameStream.VideosUrls(mobile: "https://dl.dropboxusercontent.com/s/k6g0zwmsxt9qery/TheWitcher480.mp4", tablet: "https://dl.dropboxusercontent.com/s/9faic5dtebavp1o/TheWitcherMax.mp4"), galleryImages: ["https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_107600c1337accc09104f7a8aa7f275f23cad096.600x338.jpg", "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_ed23139c916fdb9f6dd23b2a6a01d0fbd2dd1a4f.600x338.jpg", "https://cdn.cloudflare.steamstatic.com/steam/apps/292030/ss_908485cbb1401b1ebf42e3d21a860ddc53517b08.600x338.jpg"]))
}

struct TextTitleGame: View {
    var description: String
    var fontSize: Font?
    var padding : Double?
    var isBold: Bool = true
    
    var body: some View {
        Text(description)
            .font(fontSize ?? .title2)
            .fontWeight(isBold ? .bold : .regular)
            .padding(.top,padding ?? 20)
            .foregroundStyle(.white)
    }
}

struct HeaderVideoPlay: View {
    let networkImage: URL
    let videoUrl : URL
    @State var isTapped = false
    
    var body: some View {
        ZStack {
            if !isTapped {
                Button(action: {
                    isTapped = true
                }, label: {
                    AsyncImage(url: networkImage) { image in
                        image
                            .resizable()
                            .shadow(radius: 10)
                        
                            .ignoresSafeArea()
                    } placeholder: {
                        ProgressView()
                            .frame(width: 200, height: 200)
                            .foregroundStyle(.white)
                    }
                    
                })
                VStack {
                    Spacer()
                    Image(systemName: "play.circle")
                        .resizable()
                        .frame(width: 60, height: 60)
                        .foregroundStyle(.white)
                    Spacer()
                }
            }
            if isTapped {
                VideoPlayerView(
                    videoURL: videoUrl,
                    automaticPlay: true)
            }
        }.frame(width: .infinity,height: UIScreen.main.bounds.height * 0.26)
    }
}

struct ItemGameGrid: View {
    let item: GameElement
    var body: some View {
        let networkImage = URL(string: item.galleryImages.first ?? "")!
        
        NavigationLink {
            DetailGameView(game: item)
        } label: {
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
}
