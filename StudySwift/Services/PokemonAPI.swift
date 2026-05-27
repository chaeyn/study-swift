//
//  PokemonAPI.swift
//  StudySwift
//
//  Created by chaeyn on 5/27/26.
//

import Foundation

struct PokemonAPI {
    func fetchPokemon(name: String) async throws -> Pokemon {
        var components = URLComponents(string: "https://pokemon-api.chaeyn.com/pokemon")!

        components.queryItems = [
            URLQueryItem(name: "name", value: name)
        ]

        let (data, _) = try await URLSession.shared.data(from: components.url!)
        return try JSONDecoder().decode(Pokemon.self, from: data)
    }
}
