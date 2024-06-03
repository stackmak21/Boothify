//
//  EventItemDetails.swift
//  Boothify
//
//  Created by Paris Makris on 2/6/24.
//

import SwiftUI


struct EventDetailsScreen: View {
   
    @StateObject var vm: EventDetailsViewModel = EventDetailsViewModel()
    
    var body: some View {
        EventDetailsContent(vm: vm)
    }
}


struct EventDetailsContent: View {
    
    @ObservedObject var vm: EventDetailsViewModel
    
    var body: some View {
        GeometryReader{ container in
            ZStack{
                Color.background.ignoresSafeArea()
                VStack(alignment: .leading, spacing: 0){
                    MapObject(eventAddress: "ξανθουδακη 7")
                        .frame(height: container.size.height/3)
                        .padding(.top, container.safeAreaInsets.top)
                    Spacer()
                }
            }
        }
    }
}



#Preview {
    EventDetailsScreen()
}
