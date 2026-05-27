//
//  ContentView.swift
//  StudySwift
//
//  Created by chaeyn on 5/26/26.
//

import SwiftUI

struct Pokemon: Decodable {
    let id: Int
    let name: String
    let image: String
    let types: [String]
    let height: Int
    let weight: Int
    let description: String
}

struct ContentView: View {
    @State private var name = ""
    @State private var pokemon: Pokemon?
    @State private var isLoading: Bool = false
    @State private var errorText: String?
    
    var body: some View {
        HStack (spacing: 10) {
            TextField("검색할 포켓몬을 입력해주세요", text: $name)
                .frame(width: 200)
            Button("검색") {
                Task {
                    await searchPokemon()
                }
            }.disabled(name.isEmpty || isLoading)
        }
        
        if let errorText {
            Text("\(errorText)")
                .foregroundStyle(.red)
        }
        
        if let pokemon {
            VStack {
                AsyncImage(url: URL(string: pokemon.image)) { image in
                    image.image
                }
                
                Text("\(pokemon.name)")
                    .font(.title2)
                    .bold()
                
                Text("타입: \(pokemon.types.joined(separator: ", "))")
                Text("키: \(pokemon.height)")
                Text("몸무게: \(pokemon.weight)")
                Text(pokemon.description)
                .multilineTextAlignment(.center)
            }
        }
    }
    
    func searchPokemon() async {
        isLoading = true
        errorText = ""
        
        do {
            pokemon = try await fetchPokemon(name: name)
        } catch {
            errorText = "포켓몬을 찾을 수 없습니다."
        }
        
        isLoading = false
    }

    func fetchPokemon(name: String) async throws -> Pokemon {
        var components = URLComponents(string: "https://pokemon-api.chaeyn.com/pokemon")!
        
        components.queryItems = [
            URLQueryItem(name: "name", value: name)
        ]

        let (data, _) = try await URLSession.shared.data(from: components.url!)

        return try JSONDecoder().decode(Pokemon.self, from: data)
    }
}

#Preview {
    ContentView()
        .frame(width: 800, height: 1200)
}
