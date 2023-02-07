//
//  ContentView.swift
//  UnderstandingActor
//
//  Created by Karamjit Singh on 07/02/23.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
          
            Button {
              var counter  = counter()
               
                DispatchQueue.concurrentPerform(iterations: 100) { _ in
                    Task {
                        print(await counter.increment())
                    }
                   
                }
               
                
            } label: {
                Text("Increment Number")
            }

            
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
