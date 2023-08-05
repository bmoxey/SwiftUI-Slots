//
//  ContentView.swift
//  SwiftUI Slots
//
//  Created by Brett Moxey on 5/8/2023.
//

import SwiftUI

struct ContentView: View {
    @State var credits = 1000
    @State var image1 = "🍎".image()
    @State var image2 = "🍎".image()
    @State var image3 = "🍎".image()
    let slots = "🍎🍒🌟"
    var body: some View {
        VStack {
            Text("SwiftUI Slots!")
                .font(.largeTitle)
                .padding(/*@START_MENU_TOKEN@*/.all/*@END_MENU_TOKEN@*/)
            Spacer()
            HStack {
                Text("Credit:")
                Text(String(credits))
            }
            Spacer()
            HStack {
                Image(uiImage: image1!)
                Image(uiImage: image2!)
                Image(uiImage: image3!)
            }
            Spacer()
            Button {
                credits -= 5
                let rand1 = Int.random(in: 0...2)
                let rand2 = Int.random(in: 0...2)
                let rand3 = Int.random(in: 0...2)
                if rand1 == rand2 && rand1 == rand3 {
                    credits += 50
                }
                let index1 = slots.index(slots.startIndex, offsetBy: rand1)
                let index2 = slots.index(slots.startIndex, offsetBy: rand2)
                let index3 = slots.index(slots.startIndex, offsetBy: rand3)
                image1 = String(slots[index1]).image()
                image2 = String(slots[index2]).image()
                image3 = String(slots[index3]).image()
            } label: {
                Text("Spin!")
                    .frame(width:120, height:40)
                    .background(.red)
                    .foregroundColor(.white)
                    .font(.system(size:20, weight: .bold, design: .default))
                    .cornerRadius(20.0)
            }
            Spacer()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
