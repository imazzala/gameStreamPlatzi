//
//  EditProfileView.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 12/11/2021.
//

import SwiftUI

struct EditProfileView: View {
    
    @State var imagePerfil: Image? = Image("08-swiftuiapps-2105-foto-prueba")
    @State var isCameraActive = false
    
    var body: some View {
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            ScrollView{
                VStack{
                    Text("Editar Perfil")
                        .foregroundColor(.white)
                        .fontWeight(.bold)
                        .padding(.top)
                    
                    Button(action: {isCameraActive = true}) {
                        ZStack {
                            imagePerfil!
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 118, height: 118)
                            .clipShape(Circle())
                            .sheet(isPresented: $isCameraActive) {
                                SUImagePickerView(sourceType: .camera, image: $imagePerfil, isPresented: $isCameraActive)
                            }
                            
                            Image(systemName: "camera")
                                .foregroundColor(.white)
                        }
                        
                    }
                }.padding(.bottom, 18)
                
                ModuloEditar()
            }
            
        }
    }
}

struct ModuloEditar:View{
    
    @State var correo: String = ""
    @State var contrasena: String = ""
    @State var nombre: String = ""
    
    var body: some View{
        
        VStack(alignment: .leading) {
            
            Text("Correo electrónico")
                .foregroundColor(Color("Dark-Cian"))
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack(alignment: .leading) {
                
                if correo.isEmpty{
                    Text("Ejemplo@gmail.com")
                        .accentColor(Color.gray)
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
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack(alignment: .leading){
                
                if contrasena.isEmpty{
                    Text("Ingrsa tu nueva contraseña")
                        .foregroundColor(Color.gray)
                }
                
                SecureField("", text: $contrasena)
                    .foregroundColor(.white)
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(.white))
                .padding(.bottom)
            
            Text("Nombre")
                .foregroundColor(Color(.white))
                .font(.title2)
                .fontWeight(.bold)
                .frame(maxWidth: .infinity, alignment: .leading)
            
            ZStack(alignment: .leading) {
                
                if nombre.isEmpty{
                    Text("Introduce tu nombre de usuario")
                        .foregroundColor(Color.gray)
                }
                
                TextField("", text: $nombre)
                    .foregroundColor(.white)
                
            }
            
            Divider()
                .frame(height: 1)
                .background(Color(.white))
                .padding(.bottom, 32)
            
            
            Button(action: {actualizarDatos()}) {
                Text("Actualizar Datos")
                    .fontWeight(.bold)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .center)
                    .padding(EdgeInsets(top: 11, leading: 18, bottom: 11, trailing: 18))
                    .overlay(RoundedRectangle(cornerRadius: 6).stroke(Color("Dark-Cian"), lineWidth: 3).shadow(color: .white, radius: 3))
                
            }.padding(.bottom)
            
            
        }.padding(.horizontal, 42.0)
        
    }
    
    func actualizarDatos(){
        
        let objetoActualizadorDatos = SaveData()
        let resultado = objetoActualizadorDatos.guardarDatos(correo: correo, contrasena: contrasena, nombre: nombre)
        print("Se guardaron los datos con exito? \(resultado)")
        
    }
    
}

struct EditProfileView_Previews: PreviewProvider {
    static var previews: some View {
        EditProfileView()
    }
}
