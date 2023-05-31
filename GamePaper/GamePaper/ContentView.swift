//
//  ContentView.swift
//  GamePaper
//
//  Created by ios dev lab fi unam on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack{
            BackgroundColor()
            VStack{
                Text("Steps: ")
                    .font(.title)
                Text("Your Score is: ")
                    .font(.title)
                
                Text("Select your option")
                    .font(.largeTitle)
                    .padding(.top,100)
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
