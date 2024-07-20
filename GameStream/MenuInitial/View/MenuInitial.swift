//
//  MenuInitial.swift
//  GameStream
//
//  Created by Anthony Rubio on 17/07/24.
//

import SwiftUI


enum Pages {
    case Profile, Games, Home, Favourites
}

struct MenuInitialView: View {
    @State var currentPage: Pages = Pages.Home
    
    
    
    var body: some View {
        TabView (selection: $currentPage){
            HomeView().font(.system(size: 30,weight: .bold,design: .rounded)).tabItem {
                Image(systemName: "person")
                Text("Perfil")
            }.tag(Pages.Profile)
            Text("Pantalla Juegos").font(.system(size: 30,weight: .bold,design: .rounded)).tabItem {
                Image(systemName: "gamecontroller")
                Text("Juegos ")
            }.tag(Pages.Games)
            HomeView().font(.system(size: 30,weight: .bold,design: .rounded)).tabItem {
                Image(systemName: "house")
                Text("Inicio")
            }.tag(Pages.Home)
            Text("Pantalla Favoritos").font(.system(size: 30,weight: .bold,design: .rounded)).tabItem {
                Image(systemName: "heart")
                Text("Favoritos")
            }.tag(Pages.Favourites)
        }.tint(.white)
    }
    
    
    init() {
        UITabBar.appearance().backgroundColor = UIColor(Color("BlurOpacity"))
        UITabBar.appearance().unselectedItemTintColor = UIColor(Color.white.opacity(0.5))
        UITabBar.appearance().barTintColor = UIColor(Color("BlurOpacity")) // Optional, for older versions
        
        
        print("init views")
    }
}
