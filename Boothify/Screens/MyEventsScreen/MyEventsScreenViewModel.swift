//
//  HomeScreenViewModel.swift
//  Boothify
//
//  Created by Paris Makris on 22/5/24.
//

import Foundation
import SwiftUI

@MainActor
class MyEventsScreenViewModel: BaseViewModel {
    
    @Published var events: [BoothifyEvent] = []
    @Published var isLoading: Bool = false
    
    let dataService: EventsDataService = EventsDataService()
    var userID: String?
    
    override init() {
        super.init()
        self.userID = userDefaultSettings.getUser()
    }
    
    func fetchEvents(){
        isLoading = true
        Task{
            do{
                guard let userID = userID else {return}
                events = try await dataService.fetchEvents(userID: userID)
            }catch(let error){
                print("Failed to fetch events: \(error)")
            }
            isLoading = false
        }
    }
    
    
    
   
}
