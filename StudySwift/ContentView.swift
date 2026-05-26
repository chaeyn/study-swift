//
//  ContentView.swift
//  StudySwift
//
//  Created by chaeyn on 5/26/26.
//

import SwiftUI

struct ContentView: View {
    @State private var count = 0
    
    var body: some View {
        VStack(spacing: 20) {
            Text("\(count)")
            
            HStack {
                Button("-") {
                    count -= 1
                }
                Button("+") {
                    count += 1
                }
            }
            
            HStack {
                UserCard(name: "chaeyn")
                UserCard(name: "jdw09")
            }
        }
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

struct UserCard: View {
    let name: String
    
    var body: some View {
        Text(name)
    }
}


#Preview {
    ContentView()
        .frame(width: 800, height: 500)
}
