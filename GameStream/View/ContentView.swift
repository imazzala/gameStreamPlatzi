//
//  ContentView.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 20/10/2021.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView {
            ZStack {
                
                Spacer()
                
                Color(red: 19/255, green: 28/255, blue: 53/255).ignoresSafeArea()
                
                VStack {
                    Image("AppLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 250)
                        .padding(.bottom, 42).offset(x: 0, y: 15)
                    
                    InicioYRegistroView()
                    
                }.navigationBarHidden(true)
            }
        }.navigationViewStyle(StackNavigationViewStyle())
    }
}


struct InicioYRegistroView : View {
    
    @State var tipoInicioSesion = true
    
    var body: some View {
        
        VStack{
            
            HStack {
                
                Spacer()
                
                Button("INICIA SESIÓN") {
                    tipoInicioSesion = true
                    print("Pantalla de Inicio de Sesión")
                }
                .foregroundColor(tipoInicioSesion ? .white : .gray)
                
                Spacer()
                
                Button("REGÍSTRATE") {
                    tipoInicioSesion = false
                    print("Pantalla de Registro")
                }
                .foregroundColor(tipoInicioSesion ? .gray : .white)
                Spacer()
                
            }
            
            Spacer(minLength: 42)
            
            if tipoInicioSesion == true {
                
                InicioSesionView()
                
            } else {
                RegistroView()
            }
        }
    }
}



struct InicioSesionView : View {
    
    @State var correo : String = ""
    @State var contrasena : String = ""
    @State var isPantallaHomeActive = false
    
    var body: some View{
        
        ScrollView {
            
            VStack(alignment: .leading) {
                Text("Correo Electrónico")
                    .foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty {
                        Text("ejemplo@gmail.com")
                            .accentColor(Color.gray)
                            .font(.caption)
                        
                        
                    }
                    
                    TextField("", text: $correo)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Contraseña")
                    .foregroundColor(Color(.white))
                
                
                ZStack(alignment: .leading){
                    
                    if contrasena.isEmpty {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        
                    }
                    
                    SecureField("", text: $contrasena)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("¿Olvidaste tu contraseña?")
                    .font(.footnote)
                    .frame(width: 350, alignment: .trailing)
                    .foregroundColor(Color("Dark-Cian"))
                    .padding(.bottom,25)
                
                Button(action: iniciarSesion) {
                    Text("INICIAR SESIÓN")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color("Dark-Cian"),lineWidth: 1.0).shadow(color: .white, radius: 8))
                }
                
                
                Text("Inicia Sesion con Redes Sociales")
                    .foregroundColor(.white)
                    .padding(.top, 80)
                    .padding(.bottom, 25)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                HStack{
                    Spacer()
                    
                    Button("Facebook") {
                        print("Login con Fb")
                    }.foregroundColor(.white)
                        .font(.subheadline)
                        .frame(width: 125, alignment: .center)
                        .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                        .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color("blueBoat")))
                    
                    Spacer(minLength: 25)
                    
                    Button("Twitter") {
                        print("Login con Twitter")
                    }.foregroundColor(.white)
                        .font(.subheadline)
                        .frame(width: 125, alignment: .center)
                        .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                        .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color("blueBoat")))
                    
                    Spacer()
                    
                }
                
                
            }
            
            NavigationLink(destination: Home(), isActive: $isPantallaHomeActive, label: {EmptyView()})
            
        }.padding(.horizontal, 77)
    }
    
    func iniciarSesion(){
        print("Estoy inciando sesion")
        
        isPantallaHomeActive = true
    }
}





struct RegistroView : View {
    
    @State var correo : String = ""
    @State var contrasena : String = ""
    @State var confirmarContrasena : String = ""
    
    var body: some View{
        ScrollView {
            
            VStack(alignment: .center) {
                Text("Elige una foto de perfil")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                
                Text("Puedes cambiar o elegirla más adelante")
                    .font(.footnote)
                    .fontWeight(.light)
                    .foregroundColor(.gray)
                    .frame(width: 300, alignment: .center)
                    .padding(.top,0.3)
                    .padding(.bottom)
                

                Button(action: tomarFoto, label: {
                    
                    ZStack{
                        Image("08-swiftuiapps-2105-foto-prueba")
                            .resizable().aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        
                        Image(systemName: "camera")
                            .foregroundColor(.white)
                            .frame(width: 25, height: 25, alignment: .center)
                    }
                    
                }).padding(.bottom, 20)
                
            }
            
            VStack(alignment: .leading) {
                Text("Correo Electrónico*")
                    .foregroundColor(Color("Dark-Cian"))
                
                ZStack(alignment: .leading){
                    
                    if correo.isEmpty {
                        Text("ejemplo@gmail.com")
                            .foregroundColor(Color.gray)
                            .font(.caption)
                        
                        
                    }
                    
                    TextField("", text: $correo)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Contraseña*")
                    .foregroundColor(Color(.white))
                
                
                ZStack(alignment: .leading){
                    
                    if contrasena.isEmpty {
                        Text("Escribe tu contraseña")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        
                    }
                    
                    SecureField("", text: $contrasena)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
                Text("Confirmar Contraseña*")
                    .foregroundColor(Color(.white))
                
                
                ZStack(alignment: .leading){
                    
                    if confirmarContrasena.isEmpty {
                        Text("Vuelve a escribir tu contraseña")
                            .font(.caption)
                            .foregroundColor(Color.gray)
                        
                    }
                    
                    SecureField("", text: $confirmarContrasena)
                        .foregroundColor(.white)
                }
                
                Divider()
                    .frame(height: 1)
                    .background(Color("Dark-Cian"))
                    .padding(.bottom)
                
            }
                
            VStack{
                
                Button(action: registrate) {
                    Text("REGÍSTRATE")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .frame(maxWidth: .infinity, alignment: .center)
                        .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                        .overlay(RoundedRectangle(cornerRadius: 10.0).stroke(Color("Dark-Cian"),lineWidth: 1.0).shadow(color: .white, radius: 8))
                }
                
                Text("Regístrate con Redes Sociales")
                    .foregroundColor(.white)
                    .padding(.top)
                    .padding(.bottom, 25)
                    .font(.subheadline)
                    .frame(maxWidth: .infinity, alignment: .center)
                
                HStack{
                    Spacer()
                    
                    Button("Facebook") {
                        print("Login con Fb")
                    }.foregroundColor(.white)
                        .font(.subheadline)
                        .frame(width: 125, alignment: .center)
                        .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                        .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color("blueBoat")))
                    
                    Spacer(minLength: 25)
                    
                    Button("Twitter") {
                        print("Login con Twitter")
                    }.foregroundColor(.white)
                        .font(.subheadline)
                        .frame(width: 125, alignment: .center)
                        .padding(EdgeInsets(top: 9, leading: 15, bottom: 9, trailing: 15))
                        .background(RoundedRectangle(cornerRadius: 10.0).foregroundColor(Color("blueBoat")))
                    
                    Spacer()
                    
                }
                
                
            }
            
        }.padding(.horizontal, 77)
    }
}


func tomarFoto(){
    print("Voy a tomar foto de perfil")
}

func registrate(){
    print("Registro de usuario")
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        
        ContentView()
        //Image("04_swiftui-apps-ios-pantalla2")
        
    }
}
