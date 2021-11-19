//
//  ViewModel.swift
//  GameStream
//
//  Created by Ivan Ezequiel Mazzalay on 28/10/2021.
//

import Foundation

class viewModel: ObservableObject {
    
    @Published var gamesInfo = [Game]()
    
    init(){
        
        let url = URL(string: "https://gamestream-api.herokuapp.com/api/games")!
        var request = URLRequest(url: url)
        
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request){ data, response, error in
            
            do{
                if let jsonData = data {
                    
                    print("tamaño del json \(jsonData)")
                    
                    let decodeData = try
                        JSONDecoder().decode([Game].self, from: jsonData)
                        
                        DispatchQueue.main.async {
                            self.gamesInfo.append(contentsOf: decodeData)
                        
                }
                
            }
                
            } catch{
                print("Error: \(error)")
            }
        }.resume()
        
    }
}
