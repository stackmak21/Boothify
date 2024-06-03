//
//  ListingItem.swift
//  Boothify
//
//  Created by Paris Makris on 30/5/24.
//

import Foundation
import SwiftUI

struct MyEventsItem: View {
    var title: String
    let eventType: String
    let location: String
    let duration: String
    let employes: String
    let crowd: String
    let date: String
    
    init(
        title: String = "Κωνσταντίνα Κρούσταλλη - Σαλαμίνα",
        eventType: String = "Event",
        location: String = "Σαλαμίνα, ΑΚΤΑΙΑ",
        duration: String = "4",
        employes: String = "Γιάννης, Κωνσταντίνα",
        crowd: String = "200",
        date: String = "2024-03-03"
    ) {
        self.title = title
        self.eventType = eventType
        self.location = location
        self.duration = duration
        self.employes = employes
        self.crowd = crowd
        self.date = date
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 0){
            HStack(alignment: .top, spacing: 0){
                Text(title)
                    .font(Typography.bold(size: 16))
                    .foregroundStyle(Color.white)
                    .lineLimit(2)
                Spacer()
                Label(title: {Text(eventType)}, icon: {Image(systemName: "heart.fill")})
                    .font(Typography.bold(size: 14))
                    .foregroundColor(Color.yellow)
                    .padding(6)
                    .background(Color.background).clipShape(RoundedRectangle(cornerRadius: 6))
            }
            Spacer().frame(height: 14)
            Label(title: {Text(location)}, icon: {Image(systemName: "location.circle")})
                .font(Typography.bold(size: 14))
                .foregroundColor(Color.white)
            Spacer().frame(height: 6)
            HStack(spacing: 0){
                Label(title: {Text(duration)}, icon: {Image(systemName: "clock.fill")})
                    .font(Typography.bold(size: 14))
                    .foregroundColor(Color.white)
                Spacer()
                Label(title: {Text(crowd)}, icon: {Image(systemName: "person.3.fill")})
                    .font(Typography.bold(size: 14))
                    .foregroundColor(Color.white)
                    .labelStyle(TrailingLabelStyle())
            }
            Spacer().frame(height: 14)
            HStack(spacing: 0){
                Label(title: {Text(employes)}, icon: {Image(systemName: "person.2.fill")})
                    .font(Typography.bold(size: 14))
                    .foregroundColor(Color.white)
                Spacer()
                Label(title: {Text(date)}, icon: {Image(systemName: "calendar")})
                    .font(Typography.bold(size: 14))
                    .foregroundColor(Color.white)
                    .labelStyle(TrailingLabelStyle())
            }
        }
        .padding(.horizontal, 14)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity)
        .frame(height: 150)
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
                MyEventsItem()
                MyEventsItem(title: "Medicare - Mairi Kanellopoulou")
                MyEventsItem()
                MyEventsItem()
            }
            .padding()
        }
    }
}
