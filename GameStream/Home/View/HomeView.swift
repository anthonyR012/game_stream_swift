//
//  HomeView.swift
//  GameStream
//
//  Created by Anthony Rubio on 13/07/24.
//

import SwiftUI

struct HomeView : View {
    var body: some View {
        ZStack {
            Color("MainColor")
                .ignoresSafeArea()
            ScrollView {
                VStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 200, height: 25)
                        .padding(.bottom, 10)
                    ContentHomeView()
                }
            }
        }
    }
}



struct TextTitleHome: View {
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

struct ContentHomeView: View {
    @StateObject private var viewModel = HomeViewModel()
    
    var body: some View {
        VStack (alignment: .leading) {
            if viewModel.isLoading {
                VStack {
                    Spacer()
                    ProgressView("Loading...").foregroundStyle(.darkCian)
                    Spacer()
                }
            } else if let errorMessage = viewModel.errorMessage    {
                Text(errorMessage)
            } else if viewModel.gamesInfo.isEmpty {
                Text("Sin resultados")
            } else {
                InputSearchHome()
                MostPopularView(mostPopular: viewModel.gamesInfo.first!)
                CategoriesView()
                RecommendedView()
                MayLikedYouView()
                
            }
            
            
        }.padding(20)
            .onAppear {
                viewModel.fetchGames()
            }
    }
}

struct InputSearchHome: View {
    @State var queryGame : String = ""
    @FocusState var isFocused : Bool
    
    var body: some View {
        ZStack (alignment: .leading){
            Rectangle()
                .foregroundColor(Color("BlueGray"))
                .background(Color.blue)
                .cornerRadius(20)
            HStack{
                Image(systemName: "magnifyingglass")
                    .resizable()
                    .frame(width: 15,height: 15)
                    .foregroundStyle(isFocused ? .darkCian : .white)
                    .padding(.leading,15)
                if queryGame.isEmpty {
                    Text("Buscar un video")
                        .font(.headline)
                        .bold()
                        .foregroundStyle(isFocused ? .darkCian : .white.opacity(0.5))
                }
                               
            }
            TextField("", text: $queryGame)
                .foregroundColor(.white)
                .focused($isFocused)
                .font(.footnote).padding(.leading,40)
            
        }.frame(
            width: UIScreen.main.bounds.width * 0.9,
            height: 35)
        .padding(.top,10)
    }
}


#Preview{
    HomeView()
}




struct ItemCategoryView: View {
    var description : String
    var icon : String
    var body: some View {
        ZStack{
            Rectangle()
                .clipShape(RoundedCorners(
                    topLeft: 4,topRight: 4, bottomLeft: 4,bottomRight: 4))
                .foregroundStyle(.blueGray)
            VStack{
                Image(systemName:icon)
                    .resizable()
                    .frame(width: 33,height: 30)
                    .foregroundStyle(.darkCian)
                Text(description)
                    .font(.title2)
                    .bold()
                    .foregroundStyle(.darkCian)
            }
        }.frame(
            width: UIScreen.main.bounds.width * 0.6,
            height: 120
        )
    }
}

struct CategoriesView: View {
    var body: some View {
        VStack (alignment: .leading) {
            TextTitleHome(description: "CATEGORÍAS SUGERIDAS PARA TI")
                .padding(.leading, 5)
            ScrollView (.horizontal,showsIndicators: true) {
                HStack{
                    ItemCategoryView(description: "FPS", icon:  "tent.circle")
                    ItemCategoryView(description: "RPG", icon:  "gamecontroller")
                    
                }
            }
        }
    }
}

struct RecommendedView: View {
    var body: some View {
        VStack (alignment: .leading) {
            TextTitleHome(description: "RECOMENDADO PARA TI")
                .padding(.leading, 5)
            ScrollView (.horizontal, showsIndicators: false) {
                HStack{
                    Rectangle()
                        .clipShape(RoundedCorners(
                            topLeft: 4,topRight: 4, bottomLeft: 4,bottomRight: 4))
                        .foregroundStyle(.blueGray).frame(
                            width: UIScreen.main.bounds.width * 0.7,
                            height: 160
                        )
                    Rectangle()
                        .clipShape(RoundedCorners(
                            topLeft: 4,topRight: 4, bottomLeft: 4,bottomRight: 4))
                        .foregroundStyle(.blueGray).frame(
                            width: UIScreen.main.bounds.width * 0.7,
                            height: 160
                        )
                    
                }
            }
        }
    }
}


struct MayLikedYouView: View {
    var body: some View {
        VStack (alignment: .leading) {
            TextTitleHome(description: "VIDEOS QUE PODRíAN GUSTARTE")
                .padding(.leading, 5)
            ScrollView (.horizontal, showsIndicators: false) {
                HStack{
                    Rectangle()
                        .clipShape(RoundedCorners(
                            topLeft: 4,topRight: 4, bottomLeft: 4,bottomRight: 4))
                        .foregroundStyle(.blueGray).frame(
                            width: UIScreen.main.bounds.width * 0.7,
                            height: 160
                        )
                    Rectangle()
                        .clipShape(RoundedCorners(
                            topLeft: 4,topRight: 4, bottomLeft: 4,bottomRight: 4))
                        .foregroundStyle(.blueGray).frame(
                            width: UIScreen.main.bounds.width * 0.7,
                            height: 160
                        )
                    
                }
            }
        }
    }
}


