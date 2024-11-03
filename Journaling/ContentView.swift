//
//  ContentView.swift
//  Journaling
//
//  Created by Asma Mohammed on 17/04/1446 AH.
//
import SwiftUI

struct Journal : Identifiable {
    var id = UUID()
    var title : String
    var date : Date
    var text : String
    var isBookmarked: Bool
}

struct ContentView: View {
    var body: some View {
          
            
        VStack(spacing: 11) {
                Image("Book")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 77.7, height: 101)
                    .padding(.bottom, (24.23 - 11))
                
                Text("Journali")
                .font(.system(size: 42, weight: .black))
                    .fontWeight(.bold)

                   
                
           
                Text("Your thoughts, your story")
                    .multilineTextAlignment(.center)



        
                
            }
           

        }
       
    }


#Preview {
    ContentView()
}
