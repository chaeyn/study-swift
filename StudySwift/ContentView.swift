//
//  ContentView.swift
//  StudySwift
//
//  Created by chaeyn on 5/26/26.
//

import SwiftUI

struct User: Identifiable {
    let id = UUID()
    let name: String
}

let users = [
    User(name: "chaeyn"),
    User(name: "jdw09"),
    User(name: "gorani1231")
]

struct ContentView: View {
    @State private var count = 0
    @State private var name = ""

    var body: some View {
        VStack(spacing: 20) {
            VStack {
                TextField("이름 입력", text: $name) // $name에서 $은 값에 연결된 상태를 의미
                Text("안녕하세요 \(name)님!")
            }
            
            Text("\(count)")
            
            HStack {
                Button("-") {
                    count -= 1
                    print("minus 1")
                }
                Button("+") {
                    count += 1
                    print("plus 1")
                }
            }
            
            HStack {
                UserCard(name: "chaeyn")
                UserCard(name: "jdw09")
            }
            
            VStack {
                ForEach(users) { user in
                    Text(user.name)
                }
            }
        }
    }
    
//    // immutable (const)
//    let name = "chaeyn"
//
//    // mutable
//    var age = 18
//
//    // type
//    let name2: String = "chaeyn"
//    let age2: Int = 18
//
//    // optional
//    var name3: String?
//
//    func hello(name: String) -> String {
//        return "hello \(name)"
//    }
//
//    print(hello(name: name))
//
//    enum NetworkState {
//        case loading
//        case success
//        case failure
//    }

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
