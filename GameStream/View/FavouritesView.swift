//
//  FavouritesView.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 12/11/2021.
//

import SwiftUI
import AVKit

struct FavouritesView: View {
    
    @ObservedObject var todosLosVideoJuegos = viewModel()
    
    var body: some View {
        ZStack{
            
            Color("Marine").ignoresSafeArea()
            
            VStack{
                
                Text("Favoritos")
                    .foregroundColor(.white)
                    .font(.title2)
                    .fontWeight(.bold)
                    .padding(.bottom, 9.0)
                
                ScrollView{
                    
                    ForEach(todosLosVideoJuegos.gamesInfo, id: \.self){
                        juego in
                        
                        VStack(spacing: 0) {
                            VideoPlayer(player: AVPlayer(url: URL(string: juego.videosUrls.mobile)!))
                                .frame(height: 300)
                            
                            Text("\(juego.title)")
                                .padding()
                                .foregroundColor(.white)
                                .frame(maxWidth: .infinity, alignment: .leading)
                                .background(Color("BlueGray"))
                                .clipShape(RoundedRectangle(cornerRadius: 5))
                        }
                    }
                }.padding(.bottom, 8)
                
            }.padding(.horizontal, 6)
            
        }
        .navigationBarHidden(true)
        .navigationBarBackButtonHidden(true)
    }
}

struct FavouritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavouritesView()
    }
}
