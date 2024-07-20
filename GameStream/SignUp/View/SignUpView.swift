//
//  SignUpView.swift
//  GameStream
//
//  Created by Anthony Rubio on 13/07/24.
//

import SwiftUI

struct SignUpView: View {
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var passwordVerified: String = ""
    
    var body: some View {
        VStack {
            ChoosePhotoView()
            InputFieldView(text: $password,
                           description: "Correo electrónico *")
            InputFieldView(text: $password,
                           description: "Contraseña *",
                           isSecure: true)
            InputFieldView(text: $password,
                           description: "Confirmar contraseña *",
                           isSecure: true)
            FooterViewSignUp()
        }
    }
}


struct FooterViewSignUp: View {
    var body: some View {
        VStack{
            
            ButtonMainView(description: "REGÍSTRATE") {
                print("loading")
            }
            Text("Regístrate con redes sociales")
                .foregroundStyle(Color(.white))
                .padding(.top,20)
                .frame(maxWidth: .infinity)
            HStack{
                ButtonGrayLabel(description: "Facebook")
                ButtonGrayLabel(description: "Instagram")
            }.padding(.top,5)
        }
    }
}

