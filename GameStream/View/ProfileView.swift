//
//  ProfileView.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 12/11/2021.
//

import SwiftUI

struct ProfileView: View {
    
    @State var nombreUsuario: String = "Lorem"
    @State var imagenPerfil: UIImage = UIImage(named: "08-swiftuiapps-2105-foto-prueba")!
    
    var body: some View {
        
        
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            VStack(){
                
                Text("Perfil")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                    .padding()
                
                VStack{
                    
                    Image(uiImage: imagenPerfil)
                        .resizable()
                        .aspectRatio(contentMode: .fill).frame(width: 118, height: 118)
                        .clipShape(Circle())
                    
                    Text(nombreUsuario)
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                    
                }.padding(EdgeInsets(top: 16, leading: 0, bottom: 32, trailing: 0))
                
                Text("Ajustes")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .font(.title2)
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 8)
                
                ModuloAjustes()
                
            }.navigationBarHidden(true).navigationBarBackButtonHidden(true)
            
        }.onAppear {
            
            if returnUiImage(named: "fotoPerfil") != nil {
                imagenPerfil = returnUiImage(named: "fotoPerfil")!
            } else{
                print("No encontre foto de perfil guardada en el dispositivo")
            }
            
            if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
                nombreUsuario = UserDefaults.standard.stringArray(forKey: "datosUsuario")![2]
            } else{
                print("No encontré información del usuario")
            }
            
        }.onDisappear {
            print("Cerrando la pantalla")
        }
    }
    
    func returnUiImage(named: String) -> UIImage? {
        
        if let dir = try? FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false) {
            
            return UIImage(contentsOfFile: URL(fileURLWithPath: dir.absoluteString).appendingPathComponent(named).path)
            
        }
        
        return nil
        
    }
}

struct ModuloAjustes: View{
    
    @State var isToogleOn = true
    @State var isEditProfileViewActive = false
    
    var body: some View{
        
        VStack(spacing: 3){
            
            HStack {
                Button(action: {}) {
                    Text("Cuenta").foregroundColor(.white)
                }
                Spacer()
                Text(">").foregroundColor(.white)
            }
            .padding()
            .background(Color("BlueGray"))
            .clipShape(RoundedRectangle(cornerRadius: 1))
            
            
            HStack {
                Button(action: {}) {
                    Text("Notificaciones").foregroundColor(.white)
                }
                Spacer()
                Toggle("", isOn: $isToogleOn)
            }
            .padding()
            .background(Color("BlueGray"))
            .clipShape(RoundedRectangle(cornerRadius: 1))
            
            
            HStack {
                Button(action: {
                    isEditProfileViewActive = true
                }) {
                    Text("Editar Perfil").foregroundColor(.white)
                }
                Spacer()
                Text(">").foregroundColor(.white)
            }
            .padding()
            .background(Color("BlueGray"))
            .clipShape(RoundedRectangle(cornerRadius: 1))
            
            
            HStack {
                Button(action: {}) {
                    Text("Calificar esta Aplicación").foregroundColor(.white)
                }
                Spacer()
                Text(">").foregroundColor(.white)
            }
            .padding()
            .background(Color("BlueGray"))
            .clipShape(RoundedRectangle(cornerRadius: 1))
            
            Spacer()
            
            NavigationLink(destination: EditProfileView(),
                           isActive: $isEditProfileViewActive,
                           label: {EmptyView()})
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
