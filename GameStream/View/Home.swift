//
//  Home.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 22/10/2021.
//

import SwiftUI
import AVKit

struct Home: View {

    @State var tabSeleccionado: Int = 2
    
    init(){
        UITabBar.appearance().backgroundColor = UIColor(Color("TabBar-Color"))
        UITabBar.appearance().barTintColor = .white
        UITabBar.appearance().isTranslucent = true
    }
        
    var body: some View {
        
        TabView(selection: $tabSeleccionado){
            
            ProfileView()
                .tabItem {
                    Image(systemName: "person")
                    Text("Perfil")
                }.tag(0)
            
                GamesView()
                .tabItem {
                    Image(systemName: "gamecontroller")
                    Text("Juegos")
                }.tag(1)
            
            PantallaHome()
                .tabItem {
                    Image(systemName: "house")
                    Text("Inicio")
                }.tag(2)
            
            
            FavouritesView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favoritos")
                }.tag(3)
        }
        .accentColor(.white)
    }
}


struct PantallaHome : View {
       
    var body: some View{
        
        ZStack {
            
            Color("Marine").ignoresSafeArea()
            
            VStack {
                
                Image("AppLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
                    .padding(.horizontal, 11)
                

                
                ScrollView(showsIndicators: false){
                    SubModuloHome()
                }

            }.padding(.horizontal, 28)
        
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
        
        
    }
}


struct SubModuloHome : View {
    /*
    @State var url = "https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4"
    let urlVideos:[String] = ["https://cdn.cloudflare.steamstatic.com/steam/apps/256658589/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256671638/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256720061/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256814567/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256705156/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256801252/movie480.mp4","https://cdn.cloudflare.steamstatic.com/steam/apps/256757119/movie480.mp4"]*/

    @State var isPlayerActive = false
    @State var textoBusqueda : String = ""
    @State var isGameInfoEmpty: Bool = false
    @State var isGameViewActive: Bool = false
    @ObservedObject var juegoEcnontrado = SearchGame()
    
    @State var url: String = ""
    @State var titulo: String = ""
    @State var studio: String = ""
    @State var calificacion: String = ""
    @State var anoPublicacion: String = ""
    @State var descripcion: String = ""
    @State var tags:[String] = [""]
    @State var imgUrl: [String] = [""]
    
    var dispositivo = UIDevice.current.model
    
    
    var body: some View{
        
        VStack {
            
            HStack{
                
                Button(action: {watchGame(name: textoBusqueda)},label: {Image(systemName: "magnifyingglass")
                    .foregroundColor(textoBusqueda.isEmpty ? Color(.yellow) : Color("Dark-Cian"))})
                    .alert(isPresented: $isGameInfoEmpty){
                        Alert(title: Text("Error"), message: Text("No se encontró el juego"), dismissButton: .default(Text("Entendido")))
                    }
                
                ZStack(alignment: .leading){
                    
                    if textoBusqueda.isEmpty {
                        Text("Buscar un Video")
                            .foregroundColor(Color(red: 174/255, green: 177/255, blue: 185/255))
                    }
                    
                    TextField("", text: $textoBusqueda)
                        .foregroundColor(.white)
                    
                }
                
            }
            .padding([.top, .leading, .bottom], 11)
            .background(Color("BlueGray"))
            .clipShape(Capsule())
            
            Text("LOS MÁS POPULARES")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ZStack{
                
                Button(action: {
                    watchGame(name: "The Witcher 3")
                }, label: {
                    VStack(spacing: 0){
                        Image("thewitcher")
                            .resizable()
                            .scaledToFill()
                        
                        Text("The Witcher 3")
                            .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                            .background(Color("BlueGray"))
                    }
                })
                
                Image(systemName: "play.circle.fill")
                    .resizable()
                    .foregroundColor(.white).frame(width: 42, height: 42)
                
            }
            .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            .padding(.vertical)
            
            
            Text("CATEGORÍAS SUGERIDAS PARA TÍ")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                if (dispositivo == "iPad"){
                    
                    HStack{
                        
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("BlueGray"))
                                    .frame(width: 320, height: 180)
                                
                                Image("fps")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 84, height: 84)
                                
                            }
                        })
                        
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("BlueGray"))
                                    .frame(width: 320, height: 180)
                                
                                Image("rpg-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 84, height: 84)
                                
                            }
                        })
                        
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("BlueGray"))
                                    .frame(width: 320, height: 180)
                                
                                Image("open-world-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 84, height: 84)
                                
                            }
                        })
                        
                    }
                    
                } else {
                    
                    HStack{
                        
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("BlueGray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("fps")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                            }
                        })
                        
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("BlueGray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("rpg-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                            }
                        })
                        
                        Button(action: {}, label: {
                            ZStack{
                                RoundedRectangle(cornerRadius: 8)
                                    .fill(Color("BlueGray"))
                                    .frame(width: 160, height: 90)
                                
                                Image("open-world-icon")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 42, height: 42)
                                
                            }
                        })
                        
                    }
                    
                }
                
               
                
            }
            
            Text("RECOMENDADOS PARA TÍ")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    
                    Button(action: {
                        watchGame(name: "Abzu")
                    }, label: {
                        ZStack{
                            
                            Image("Abzu")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                            
                        }
                    })
                    
                    Button(action: {
                        watchGame(name: "Crash Bandicoot")
                    }, label: {
                        ZStack{
                            
                            Image("CrashBandicoot")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                            
                        }
                    })
                    
                    Button(action: {
                        watchGame(name: "DeathStranding")

                    }, label: {
                        ZStack{
                            
                            Image("Death Stranding")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                            
                        }
                    })

                    
                }
                
            }
            
            Text("VIDEOS QUE PODRÍAN GUSTARTE")
                .font(.title3)
                .foregroundColor(.white)
                .fontWeight(.bold)
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .leading)
                .padding(.top)
            
            ScrollView(.horizontal, showsIndicators: false){
                
                HStack{
                    
                    Button(action: {
                        watchGame(name: "Cuphead")
                    }, label: {
                        ZStack{
                            
                            Image("Cuphead")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                            
                        }
                    })
                    
                    Button(action: {
                        watchGame(name: "Hades")
                    }, label: {
                        ZStack{
                            
                            Image("Hades")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                            
                        }
                    })
                    
                    Button(action: {
                        watchGame(name: "Grand Theft Auto V")
                    }, label: {
                        ZStack{
                            
                            Image("Grand Theft Auto V")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 240, height: 135)
                            
                        }
                    })
                    
                }
                
            }
            
            
            
        }
        
        NavigationLink(
            destination: GameView(url: url, titulo: titulo, studio: studio, calificacion: calificacion, anoPublicacion: anoPublicacion, descripcion: descripcion, tags: tags, imgUrl: imgUrl),
            isActive: $isGameViewActive,
            label: {
                EmptyView()
            })
    }
    
    func watchGame(name: String){
        
        juegoEcnontrado.search(gameName: name)
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.3) {
            
            print("Cantidad E: \(juegoEcnontrado.gameInfo.count)")
            
            if juegoEcnontrado.gameInfo.count == 0 {
                
                isGameInfoEmpty = true
                
            } else {
                
                url = juegoEcnontrado.gameInfo[0].videosUrls.mobile
                titulo = juegoEcnontrado.gameInfo[0].title
                studio = juegoEcnontrado.gameInfo[0].studio
                calificacion = juegoEcnontrado.gameInfo[0].contentRaiting
                anoPublicacion = juegoEcnontrado.gameInfo[0].publicationYear
                descripcion = juegoEcnontrado.gameInfo[0].description
                tags = juegoEcnontrado.gameInfo[0].tags
                imgUrl = juegoEcnontrado.gameInfo[0].galleryImages
                
                isGameViewActive = true
                
                
            }
        }
    }
}


struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}
