//
//  CurrentDateListViewModel.swift
//  AsyncAwait-MVVM
//
//  Created by Karamjit Singh on 01/02/23.
//

import Foundation

@MainActor
class CurrentDataListViewModel: ObservableObject {
    
    @Published var currentDates: [CurrentDateViewModel] = []
    
    func populateDate() async {
        do {
            let result = try? await ServiceManager().APIRequest(url: RequestURLS.currentDateUrl, Type: CurrentDate.self)
            switch result {
            case .success(let currentDate):
               // DispatchQueue.main.async {[weak self] in
                //    guard let selfRef = self else { return }
                  currentDates.append(CurrentDateViewModel(currentDate: currentDate))
               // }
                break
            case .failure(let error):
                debugPrint(error)
                break
            case .none:
                break
            }
        }
    }
}
