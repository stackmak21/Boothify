//
//  BoothifyEvent.swift
//  Boothify
//
//  Created by Paris Makris on 4/6/24.
//

import Foundation


struct BoothifyEvent: Hashable, Codable {
    let id: String?
    let url: String?
    let dateOfEvent: String?
    let phoneNumber: String?
    let attendance: String?
    let hours: String?
    let venue: String?
    let region: String?
    let email: String?
    let eventType: EventType?
    let name: String?
    let contactSource: String?
    let schedule: String?
}

enum EventType: String, Codable {
    case baptism = "BAPTISM"
    case wedding = "WEDDING"
    case party = "PARTY"
    case promoActivation = "PROMO_ACTIVATION"
}
