//
//  ContentView.swift
//  AsyncAwait-MVVM
//
//  Created by Karamjit Singh on 01/02/23.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var currentDateListVM = CurrentDataListViewModel()
    
    var body: some View {
        NavigationView {
            List(currentDateListVM.currentDates, id:\.id) { currentDate in
                Text("\(currentDate.date)")
            }.listStyle(.plain)
            
            .navigationTitle("Dates")
            .navigationBarItems(trailing: Button(action: {
                // button action
                
                Task {
                     await currentDateListVM.populateDate()
                }
            }, label: {
                Image(systemName: "arrow.clockwise.circle")
            }))
            .task {
                await currentDateListVM.populateDate()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
