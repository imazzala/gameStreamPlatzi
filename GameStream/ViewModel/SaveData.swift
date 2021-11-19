//
//  SaveData.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 17/11/2021.
//

import Foundation

class SaveData{
    
    var correo: String = ""
    var contrasena: String = ""
    var nombre: String = ""
    
    func guardarDatos(correo: String, contrasena: String, nombre: String) -> Bool {
        
        print("Dentro de la función Guardar Datos obtuve: \(correo) + \(contrasena) + \(nombre)")
        UserDefaults.standard.set([correo, contrasena, nombre], forKey: "datosUsuario")
        return true
        
    }
    
    func recuperarDatos() -> [String]{
        
        let datosUsuario: [String] = UserDefaults.standard.stringArray(forKey: "datosUsuario")!
        print("Estoy en el método recuperar datos y recupere: \(datosUsuario)")
        return datosUsuario
              
    }
    
    func validar(correo: String, contrasena : String) -> Bool {
        
        var correoGuardado = ""
        var contrasenaGuardada = ""
        
        print("Revisando si tengo datos en userDefaults con el correo \(correo) y la \(contrasena)")
        
        if UserDefaults.standard.object(forKey: "datosUsuario") != nil {
            
            correoGuardado = UserDefaults.standard.stringArray(forKey: "datosUsuario")![0]
            contrasenaGuardada = UserDefaults.standard.stringArray(forKey: "datosUsuario")![1]
            print("El correo guardado es \(correoGuardado) y la contraseña guardada es \(contrasenaGuardada)")
            
            if (correo == correoGuardado && contrasena == contrasenaGuardada){
    
                return true
                
            } else {
                
                return false
            }
            
        } else {
            
            print("No hay datos de usuario Guardados en el UserDefaults")
            return false
            
        }
        
    }
              
}
