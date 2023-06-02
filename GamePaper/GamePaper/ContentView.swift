//
//  ContentView.swift
//  GamePaper
//
//  Created by ios dev lab fi unam on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["Rock","Paper","Scissors"]
    
    var body: some View {
        ZStack{
            BackgroundColor()
            VStack{
                Text("Steps: ")
                    .font(.title)
                Text("Your Score is: ")
                    .font(.title)
                ImageCarouselView()
                Text("Select your option")
                    .font(.largeTitle)
                    .padding(.top,100)
            }
            HStack{
                ForEach(0 ..< moves.count){ moveId in
                    Button(action: {
                        
                    }){
                        Text("\(self.moves[moveId])")
                            .frame(width: 80,height: 100)
                            .foregroundColor(.white)
                    }
                    .frame(width: 100,height: 100,alignment: .center)
                    
                    
                }
            }
            
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
