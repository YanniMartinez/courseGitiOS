//
//  ImageCarouselView.swift
//  GamePaper
//
//  Created by MacBook 26 on 02/06/23.
//

import SwiftUI

struct ImageCarouselView: View {
    
    let moves = ["Rock", "Paper", "Scissors"]
    @State private var currentIndex = Int.random(in: 0..<3)
    
    var body: some View {
        Text(moves[currentIndex] )
            .aspectRatio(contentMode: .fit)
            .animation(.easeInOut(duration: 0.5))

    }
}

struct ImageCarouselView_Previews: PreviewProvider {
    static var previews: some View {
        ImageCarouselView()
    }
}
