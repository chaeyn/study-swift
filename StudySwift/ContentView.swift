//
//  ContentView.swift
//  StudySwift
//
//  Created by chaeyn on 5/26/26.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Text("hello")
    }
    
    // immutable (const)
    let name = "chaeyn"

    // mutable
    var age = 18

    // type
    let name2: String = "chaeyn"
    let age2: Int = 18

    // optional
    var name3: String?

    // 값 복사 기반 구조체
    struct User {
        let name: String
    }

    func hello(name: String) -> String {
        return "hello \(name)"
    }

//    print(hello(name: name))

    enum NetworkState {
        case loading
        case success
        case failure
    }

}


#Preview {
    ContentView()
        .frame(width: 800, height: 500)
}
