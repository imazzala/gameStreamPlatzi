//
//  GameView.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 08/11/2021.
//

import SwiftUI
import AVKit
import Kingfisher

struct GameView: View {
    
    var url: String
    var titulo: String
    var studio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion: String
    var tags: [String]
    var imgUrl: [String]
    
    var body: some View {
        
        ZStack{
            Color("Marine").ignoresSafeArea()
            
            VStack{
                
                video(url: url).frame(height: 300)
                
                ScrollView{
                    
                    //Informacion Video
                    videoInfo(titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion ,tags: tags).padding(.bottom)
                    
                    Gallery(imgUrl: imgUrl)
                    
                    Comentarios()
                    
                    SimilarGames()
                    
                }.frame(maxWidth: .infinity)
                
            }
        }
        
    }
}


struct video:View{
    
    var url: String
    
    var body: some View{
        
        VideoPlayer(player: AVPlayer(url: URL(string: url)!))
            .ignoresSafeArea()
    }
}

struct videoInfo: View {

    var titulo: String
    var studio: String
    var calificacion: String
    var anoPublicacion: String
    var descripcion: String
    var tags: [String]

    
    var body: some View{
        VStack(alignment: .leading){
            
            Text("\(titulo)")
                .foregroundColor(.white)
                .font(.largeTitle)
                .padding(.leading)
            
            HStack{
                Text("\(studio)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                    .padding(.leading)
                
                Text("\(calificacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
                Text("\(anoPublicacion)")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .padding(.top, 5)
                
            }
            
            Text("\(descripcion)")
                .foregroundColor(.white)
                .font(.subheadline)
                .padding(.top, 5)
                .padding(.leading)
            
            HStack{
                
                ForEach(tags, id: \.self){
                    tag in
                    
                    Text("#\(tag)")
                        .foregroundColor(.white)
                        .font(.subheadline)
                        .padding(.top, 4)
                        .padding(.leading)
                }
                
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct Gallery: View {
    
    var imgUrl:[String]
    let formaGrid = [
        GridItem(.flexible())
    ]
    
    var body: some View{
        
        VStack(alignment: .leading){
            
            Text("GALERÍA")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            ScrollView(.horizontal){
                
                LazyHGrid(rows: formaGrid,spacing: 8){
                    
                    ForEach(imgUrl, id: \.self){
                        
                        Url in
                        
                        //desplegar imagenes del servidor
                        KFImage(URL(string: Url))
                            .resizable().aspectRatio(contentMode: .fill)
                        
                    }
                }
                
            }.frame(height: 180)
            
            
        }.frame(maxWidth: .infinity, alignment: .leading)
        
    }
}

struct Comentarios: View{
    var body: some View{
        
        VStack(alignment: .leading) {
            Text("COMENTARIOS")
                .foregroundColor(.white)
                .font(.title)
                .padding(.leading)
            
            VStack{
                
                HStack{
                    Image("08-swiftuiapps-2105-foto-prueba")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 80, height: 80, alignment: .leading)
                        .padding(.leading)
                        .padding(.top)
                    
                    VStack{
                        Text("Geoff Atto")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .fontWeight(.bold)
                            .frame(alignment: .leading)
                        
                        Text("Hace 7 días")
                            .foregroundColor(.white)
                            .font(.subheadline)
                            .frame(alignment: .leading)
                            .padding(.bottom)
                    }
                    
                }.frame(maxWidth: .infinity, alignment: .leading)
                
                Text("He visto que como media tiene una gran calificación, y estoy completamente de acuerdo. Es el mejor juego que he jugado sin ninguna duda, combina una buena trama con una buenísima experiencia de juego libre gracias a su inmenso mapa y actividades.")
                    .foregroundColor(.white)
                    .font(.subheadline)
                    .frame(alignment: .leading)
                    .padding(.leading)
                    .padding(.trailing, 4)
                    .padding(.bottom)
                
            }.frame(maxWidth: .infinity, alignment: .leading)
                .background(Color("BlueGray"))
                .clipShape(RoundedRectangle(cornerRadius: 8))
                .padding(.all, 10)
        }
    }
}

struct SimilarGames: View{
    var body: some View{
        
        
        
        VStack(alignment: .leading){
            
            Text("Juegos Similares")
                .foregroundColor(.white).font(.title)
                .frame(alignment: .leading)
            
            
            ScrollView(.horizontal){
                Text("Aqui")
            }
            
        }.frame(maxWidth: .infinity, alignment: .leading)
    }
}


struct GameView_Previews: PreviewProvider {
    static var previews: some View {
        GameView(url: "Ejemplo.com", titulo: "Sonic", studio: "Sega", calificacion: "E+", anoPublicacion: "1991", descripcion: "uego de Sega Genesis publicado en 1991 con más de 40 millones de copias vendidas actualmente", tags:["plataformas","mascota"], imgUrl:  [ "https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg","https://cdn.cloudflare.steamstatic.com/steam/apps/268910/ss_615455299355eaf552c638c7ea5b24a8b46e02dd.600x338.jpg"])
    }
}
