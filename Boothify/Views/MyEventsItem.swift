//
//  ListingItem.swift
//  Boothify
//
//  Created by Paris Makris on 30/5/24.
//

import Foundation
import SwiftUI

struct MyEventsItem: View {
    
    let event: BoothifyEvent
    
    init(
        event: BoothifyEvent
    ) {
        self.event = event
    }
    
    var body: some View {
        GeometryReader{ container in
            VStack(alignment: .leading, spacing: 0){
                HStack(alignment: .top, spacing: 0){
                    if let name = event.name{
                        Text(name)
                            .font(Typography.bold(size: 16))
                            .foregroundStyle(Color.white)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .fixedSize(horizontal: false, vertical: true)
                            
                        
                    }
                    Spacer()
                    if let eventType = event.eventType{
                        EventTag(eventType: eventType)
                    }
                }
                .frame(height: container.size.height/4)
                Spacer()
                HStack{
                    Image(uiImage: Asset.locationIcon.image)
                        .resizable()
                        .renderingMode(.template)
                        .scaledToFit()
                        .foregroundStyle(Color.white)
                        .frame(height: 16)
                    if let venue = event.venue{
                        Text(venue)
                            .font(Typography.medium(size: 14))
                            .foregroundColor(Color.white)
                            .frame(width: container.size.width/1.6, alignment: .leading)
                            .multilineTextAlignment(.leading)
                            .lineLimit(2)
                            .fixedSize(horizontal: false, vertical: true)
                    }
                }
                .frame(height: container.size.height/4)
               
                
                HStack(spacing: 0){
                    HStack{
                        Image(systemName: "clock.fill")
                        if let hours = event.hours{
                            Text(hours)
                        }
                    }
                    .font(Typography.medium(size: 14))
                    .foregroundColor(Color.white)
                    
                    Spacer()
                    
                    HStack{
                        if let attendance = event.attendance{
                            Text(attendance)
                        }
                        Image(systemName: "person.3.fill")
                    }
                    .font(Typography.medium(size: 14))
                    .foregroundColor(Color.white)
                  
                }
                .frame(height: container.size.height/4)
                
                HStack(spacing: 0){
                    HStack{
                        Image(systemName: "phone.fill")
                        if let phoneNumber = event.phoneNumber{
                             Text(phoneNumber)
                        }
                    }
                    .font(Typography.medium(size: 14))
                    .foregroundColor(Color.white)
                    
                    Spacer()
                    HStack{
                        if let dateOfEvent = event.dateOfEvent{
                            Text(dateOfEvent)
                        }
                        Image(systemName: "calendar")
                    }
                    .font(Typography.medium(size: 14))
                    .foregroundColor(Color.white)
                }
                .frame(height: container.size.height/4)
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.backgroundNight).clipShape(RoundedRectangle(cornerRadius: 12))
        .overlay{
            RoundedRectangle(cornerRadius: 12).stroke(Color.letterGray.opacity(0.6), lineWidth: 1)
        }
    }
    
}

#Preview{
    ZStack{
        Color.background.ignoresSafeArea()
        VStack{
            Group{
                MyEventsItem(event: BoothifyEvent(id: "1", url: "WWW.FDFD.COM", dateOfEvent: "2024-03-12", phoneNumber: "6980376044", attendance: "200", hours: "4.0", venue: "georgiou 3ddsd dsdsds dsdsds dsds", region: "Athens", email: "parhsmakrhs@gmail.com", eventType: .wedding, name: "Medicare - Panagiotopoulou - fdsfsds ds", contactSource: "Mobile Phone", schedule: "5–9"))
                    .frame(height: 150)
            }
            .padding()
        }
    }
}


struct EventTag: View {
    
        let eventType: EventType
        
        var body: some View {
            Label(title: {Text(eventTitle())}, icon: {eventIcon()})
                .font(Typography.bold(size: 14))
                .foregroundColor(eventColor())
                .padding(6)
                .background(Color.background).clipShape(RoundedRectangle(cornerRadius: 6))
        }
        
        private func eventColor() -> Color {
            switch eventType{
            case .baptism:
                return .yellow
            case .wedding:
                return .red
            case .party:
                return .purple
            case .promoActivation:
                return .activeGreen
            }
        }
        
        private func eventTitle() -> String {
            switch eventType{
            case .baptism:
                return "Baptism"
            case .wedding:
                return "Wedding"
            case .party:
                return "Party"
            case .promoActivation:
                return "Promo"
            }
        }
        
        private func eventIcon() -> Image {
            switch eventType{
            case .baptism:
                return Image(systemName: "heart.fill")
            case .wedding:
                return Image(systemName: "heart.fill")
            case .party:
                return Image(systemName: "rotate.3d.fill")
            case .promoActivation:
                return Image(systemName: "birthday.cake.fill")
            }
        }
    }

