//
//  ContentView.swift
//  GamePaper
//
//  Created by ios dev lab fi unam on 31/05/23.
//

import SwiftUI

struct ContentView: View {
    
    let moves = ["Rock","Paper","Scissors"]
    //CPU Variable
    @State private var currentAppChoice = Int.random(in: 0 ..< 3)
    @State private var showingAlert = false
    @State private var currentStep = 1
    @State private var userScore = 0
    @State private var userSelected = -1
    @State var isAnimating = true
    
    var body: some View {
        ZStack{
            BackgroundColor()
            VStack{
                
                    
                    VStack(spacing: 45){
                        
                        Text("Steps: \(currentStep)/10")
                            .font(.title)
                        Text("Your Score is: \(userScore)")
                            .font(.title)
                        ImageCarouselView(isAnimating:$isAnimating, currentAppChoice:$currentAppChoice)
                        Text("Select your option")
                            .font(.largeTitle)
                            .padding(.top,100)
                    }
                    HStack{
                        ForEach(0 ..< moves.count){ moveId in
                            Button(action: {
                                
                                isAnimating.toggle()
                                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                                    isAnimating.toggle()
                                }
                                //TODO: Accion a realizar cuando el usuario presione el boton
                                
                                if self.currentStep == 10{
                                    self.currentStep = 0
                                    self.showingAlert = true
                                }else{
                                    self.userSelected = moveId
                                    self.calculateScore(withMove: moveId)
                                }
                            }){
                                Image("\(self.moves[moveId])")
                                    .resizable()
                                    .frame(width: 80,height: 100)
                            }
                            .frame(width: 100,height: 100,alignment: .center)
                            .scaleEffect( userSelected == moveId ? 1.5 : 1.0)
                            .alert(isPresented: self.$showingAlert){
                                //TODO: Presentara el score del usuario y sabra si gano o perdio tras X intentos
                                Alert(title: Text("Game over"),
                                      message: Text("Your final score is \(self.userScore)"),
                                      dismissButton: .default(Text("Ok")))
                            }
                            
                        }
                    }
            }
            
            
        }
    }
    
    //Funcion para calcular el score
    func calculateScore(withMove currentUserChoice: Int){
        currentAppChoice = Int.random(in: 0 ..< 3)
        
        if currentAppChoice == currentUserChoice{
            userScore += 0
        }else {
            switch currentAppChoice{
            case 0: //roc
                if currentUserChoice == 1 {
                    userScore += 1
                }else{
                    userScore -= 1
                }
            case 1: //Paper
                if currentUserChoice == 2 {
                    userScore += 1
                }else{
                    userScore -= 1
                }
            case 2: //Scissors
                if currentUserChoice == 0 {
                    userScore += 1
                }else{
                    userScore -= 1
                }
            default:
                break
            }
        }
        
        
        currentStep += 1
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
