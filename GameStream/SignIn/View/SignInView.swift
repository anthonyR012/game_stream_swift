//
//  SignInView.swift
//  GameStream
//
//  Created by Anthony Rubio on 11/07/24.
//

import SwiftUI

struct SignInView: View {
    @State private var email: String = ""
    @State private var password: String = ""

    var body: some View {
        VStack {
            InputFieldView(text: $email, description: "Correo electrónico")
            InputFieldView(text: $password,
                           description: "Contraseña",
                           showSubTitlePassword: true,
                           isSecure: true)
            FooterViewSignIn()
            
        }
    }
}




struct FooterViewSignIn: View {
    var body: some View {
        VStack{
            NavigationLink(destination: MenuInitialView()) {
                ButtonMainView(description: "INICIAR SESIÓN")
            }
            Text("Iniciar sesíon con redes sociales")
                .foregroundStyle(Color(.white))
                .padding(.top,40)
                .frame(maxWidth: .infinity)
            HStack{
                ButtonGrayLabel(description: "Facebook")
                ButtonGrayLabel(description: "Instagram")
            }.padding(.top,10)
        }
    }
}


