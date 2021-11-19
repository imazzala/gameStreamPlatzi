//
//  SearchGame.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 10/11/2021.
//

import Foundation

class SearchGame: ObservableObject  {
    
    @Published var gameInfo = [Game]()
    
    func search(gameName: String){
        
        gameInfo.removeAll()
        
        //gameNameSpaces nos permite agregar espacios en las peticiones de búsqueda al hacer una query
        let gameNameSpaces = gameName.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed)
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games/search?contains=\(gameNameSpaces ?? "cuphead")")!
        
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            
            do {
                
                if let jsonData = data {
                    
                    print("Tamaño del Json \(jsonData)")
                    
                    let decodeData = try
                    JSONDecoder().decode(Resultados.self, from: jsonData)
                    
                    DispatchQueue.main.async {
                        self.gameInfo.append(contentsOf: decodeData.results)
                    }
                }
                
            } catch{
                print("Error: \(error)")
            }
        }.resume()
    }
}
