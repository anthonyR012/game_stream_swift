import SwiftUI

enum NavigationIndex {
    case first, second
}

struct ContentView: View {
    @State private var indexEnum = NavigationIndex.first

    var body: some View {
        NavigationView {
            ZStack {
                Color("MainColor")
                    .ignoresSafeArea()
                VStack {
                    Image("Logo")
                        .resizable()
                        .frame(width: 200, height: 25)
                        .padding(.bottom, 10)
                    HeaderView(indexEnum: $indexEnum)
                        .padding(.bottom, 20)
                   
                    ScrollView {
                       
                        if indexEnum == NavigationIndex.first {
                            SignInView()
                        } else {
                            SignUpView()
                        }
                    }
                               
                    Spacer()
                    
                    
                }.padding(5)
            }
        }.navigationBarBackButtonHidden(true)
    }
}

struct HeaderView: View {
    @Binding var indexEnum: NavigationIndex

    var body: some View {
        HStack {
            Button("INICIA SESIÓN", action: {
                indexEnum = NavigationIndex.first
            })
            .foregroundStyle(indexEnum == NavigationIndex.first ? .white : .gray)
            .bold()
            Spacer()
            Button("REGÍSTRATE", action: {
                indexEnum = NavigationIndex.second
            }).foregroundStyle(indexEnum == NavigationIndex.second ? .white : .gray)
                .bold()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


