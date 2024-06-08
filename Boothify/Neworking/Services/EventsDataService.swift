//
//  EventsDataService.swift
//  Boothify
//
//  Created by Paris Makris on 4/6/24.
//

import Foundation

class EventsDataService {
    
    init() {}
    
    func fetchEvents(userID: String) async throws -> [BoothifyEvent] {
        guard let fetchedEvents: [BoothifyEvent] = await NetworkingManager.shared.downloadData(fromURL: BASE_URL) else { throw NetworkError.badResponse }
        return fetchedEvents
    }
    
}
