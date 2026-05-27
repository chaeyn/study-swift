//
//  ContentView.swift
//  StudySwift
//
//  Created by chaeyn on 5/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var name = ""
    @State private var pokemon: Pokemon?
    @State private var isLoading: Bool = false
    @State private var errorText: String?
    
    private let api = PokemonAPI()
    
    var body: some View {
        HStack (spacing: 10) {
            TextField("검색할 포켓몬을 입력해주세요", text: $name)
                .frame(width: 200)
            Button {
                Task {
                    await searchPokemon()
                }
            } label: {
                Text("검색")
                    .foregroundStyle(Color(.blue))
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
            pokemon = try await api.fetchPokemon(name: name)
        } catch {
            errorText = "포켓몬을 찾을 수 없습니다."
        }
        
        isLoading = false
    }
}

#Preview {
    ContentView()
        .frame(width: 800, height: 1200)
}
