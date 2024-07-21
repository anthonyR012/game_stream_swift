//
//  CustomViews.swift
//  GameStream
//
//  Created by Anthony Rubio on 13/07/24.
//

import Foundation
import SwiftUI
import AVKit

struct ButtonGrayLabel: View {
    var description : String
    var body: some View {
        ZStack{
            Rectangle()
                .frame(
                    width: UIScreen.main.bounds.width * 0.4,
                    height: 50
                )
                .foregroundColor(Color("BlueGray"))
                .background(Color.blue)
                .cornerRadius(10)
            
            
            Button(action: {}, label: {
                Text(description)
                    .foregroundStyle(
                        Color(.white))
                    .bold()
                
            })
        }
    }
}


struct ButtonMainView: View {
    var description : String
    var onTap : (() -> Void)?
    
    var body: some View{
            
        ZStack {
            Rectangle()
                .frame(
                    width: UIScreen.main.bounds.width * 0.8,
                    height: 50
                )
                .foregroundColor(Color("MainColor"))
                .border(Color("DarkCian"))
                .background(Color.blue)
                .cornerRadius(10)
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("DarkCian"), lineWidth: 2)
                )
                .shadow(color: Color("DarkCian").opacity(0.3), radius: 10, x: 2, y: 2)
            Text(description)
                .foregroundStyle(
                    Color(.white))
                .bold()
            
                
        }.padding(.top, 60)
          
    }
}



struct InputFieldView: View {
    @Binding var text: String
    @FocusState private var isFocused: Bool
    var description: String
    var showSubTitlePassword: Bool = false
    var isSecure : Bool = false
    
    
    var body: some View {
        VStack {
            Text(description)
                .foregroundStyle(isFocused ? Color(.white) : Color("DarkCian"))
                .bold()
                .frame(maxWidth: .infinity, alignment: .leading)
            ZStack (alignment: .leading){
                if text.isEmpty {
                    Text("Ingresa \(description)")
                        .foregroundColor(.gray)
                        .padding(.bottom, 2)
                        .bold()
                        .font(.caption)
                    
                }
                if isSecure {
                    SecureField("", text: $text)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(.white)
                        .focused($isFocused)
                        .bold()
                        .background(
                            VStack {
                                Spacer()
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(isFocused ? Color(.gray) : Color("DarkCian"))
                                    .padding(.top,2)
                            }
                        )
                } else {
                    TextField("", text: $text)
                        .textFieldStyle(PlainTextFieldStyle())
                        .foregroundColor(.white)
                        .focused($isFocused)
                        .background(
                            VStack {
                                Spacer()
                                Rectangle()
                                    .frame(height: 2)
                                    .foregroundColor(isFocused ? Color(.gray) : Color("DarkCian"))
                            }
                        )
                }
            }
           
           
            if showSubTitlePassword {
                HStack {
                    Spacer()
                    Text("¿Olvidaste tu contraseña?")
                        .font(.footnote)
                        .foregroundColor(Color("DarkCian"))
                }
            }
        }
        .padding(
            EdgeInsets(top: 5, leading: 15, bottom: 5, trailing: 15))
    }

}



struct ChoosePhotoView: View {
    var body: some View {
        VStack {
            Text("Elije una foto de perfil")
                .foregroundStyle(Color(.white)).font(.headline)
            Text("Puedes cambiar o elergirla más adelante")
                .foregroundStyle(Color(.gray))
                .font(.footnote)
            ZStack{
                Image("PlaceHolderImage")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 100, height: 100)
                    .aspectRatio(contentMode: .fit)
                    .clipShape(Circle())
                Circle()
                    .foregroundColor(
                        Color.black.opacity(0.3))
                    .frame(width: 100,height: 100)
                Image(systemName: "camera")
                    .foregroundColor(.white)
                    .frame(width: 60,height: 60)
                
                
                
            }
        }
    }
}




struct RoundedCorners: Shape {
    var topLeft: CGFloat = 0.0
    var topRight: CGFloat = 0.0
    var bottomLeft: CGFloat = 0.0
    var bottomRight: CGFloat = 0.0
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let topLeftRadius = min(min(self.topLeft, rect.width / 2), rect.height / 2)
        let topRightRadius = min(min(self.topRight, rect.width / 2), rect.height / 2)
        let bottomLeftRadius = min(min(self.bottomLeft, rect.width / 2), rect.height / 2)
        let bottomRightRadius = min(min(self.bottomRight, rect.width / 2), rect.height / 2)
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY))
        path.addArc(center: CGPoint(x: rect.maxX - topRightRadius, y: rect.minY + topRightRadius),
                    radius: topRightRadius,
                    startAngle: Angle(degrees: -90),
                    endAngle: Angle(degrees: 0),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - bottomRightRadius))
        path.addArc(center: CGPoint(x: rect.maxX - bottomRightRadius, y: rect.maxY - bottomRightRadius),
                    radius: bottomRightRadius,
                    startAngle: Angle(degrees: 0),
                    endAngle: Angle(degrees: 90),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY))
        path.addArc(center: CGPoint(x: rect.minX + bottomLeftRadius, y: rect.maxY - bottomLeftRadius),
                    radius: bottomLeftRadius,
                    startAngle: Angle(degrees: 90),
                    endAngle: Angle(degrees: 180),
                    clockwise: false)
        path.addLine(to: CGPoint(x: rect.minX, y: rect.minY + topLeftRadius))
        path.addArc(center: CGPoint(x: rect.minX + topLeftRadius, y: rect.minY + topLeftRadius),
                    radius: topLeftRadius,
                    startAngle: Angle(degrees: 180),
                    endAngle: Angle(degrees: -90),
                    clockwise: false)
        
        return path
    }
}




struct FullScreenVideoView: View {
    let videoURL: URL
    
    var body: some View {
        VideoPlayer(player: AVPlayer(url: videoURL))
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .edgesIgnoringSafeArea(.all)
    }
}



struct VideoController: UIViewControllerRepresentable {
    var videoURL: URL
    
    func makeUIViewController(context: Context) -> AVPlayerViewController {
        let controller = AVPlayerViewController()
        let player = AVPlayer(url: videoURL)
        controller.player = player
        return controller
    }
    
    func updateUIViewController(_ uiViewController: AVPlayerViewController, context: Context) {
        // Optional: Update the view controller if needed
    }
}
