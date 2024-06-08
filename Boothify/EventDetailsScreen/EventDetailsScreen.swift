//
//  EventItemDetails.swift
//  Boothify
//
//  Created by Paris Makris on 2/6/24.
//

import SwiftUI


struct EventDetailsScreen: View {

    @StateObject var vm: EventDetailsViewModel = EventDetailsViewModel()
    let event: BoothifyEvent
    
    var body: some View {
        EventDetailsContent(vm: vm, event: event)
    }
}


struct EventDetailsContent: View {
    
    @ObservedObject var vm: EventDetailsViewModel
    let event: BoothifyEvent
    
    var body: some View {
        GeometryReader{ container in
            ZStack{
                Color.background.ignoresSafeArea()
                
                ScrollView{
                    VStack(alignment: .leading, spacing: 0){
                        MapObject(eventAddress: event.venue ?? "Athens")
                            .frame(height: container.size.height/2.4)
                        HStack(alignment: .top, spacing: 0){
                            Text(event.name ?? "")
                                .font(Typography.bold(size: 20))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                            Spacer()
                            Label(title: {Text("Event")}, icon: {Image(uiImage: Asset.icon360.image).resizable().renderingMode(.template).frame(width: 20, height: 20)})
                                .font(Typography.bold(size: 20))
                                .foregroundColor(Color.activeGreen)
                                .padding(8)
                                .background(Color.backgroundNight).clipShape(RoundedRectangle(cornerRadius: 8))
                        }
                        .padding()
                        Divider().background(.letterGray).padding()
                        
                        Label(title: {Text("Athens, Grand Hyatt")}, icon: {Image(uiImage: Asset.locationIcon.image).resizable().renderingMode(.template).frame(width: 20, height: 20)})
                            .font(Typography.medium(size: 16))
                            .foregroundColor(.white)
                            .padding(.horizontal)
                        
                        
                        Spacer().frame(height: 16)
                        HStack(spacing: 0){
                            Label(title: {Text("4.0 Hours")}, icon: {Image(systemName: "clock.fill")})
                                .font(Typography.bold(size: 16))
                                .foregroundColor(Color.white)
                            Spacer()
                            Label(title: {Text("200")}, icon: {Image(systemName: "person.3.fill")})
                                .font(Typography.bold(size: 16))
                                .foregroundColor(Color.white)
                                .labelStyle(TrailingLabelStyle())
                        }
                        .padding(.horizontal)
                        Spacer().frame(height: 18)
                        HStack(spacing: 0){
                            Label(title: {Text("Γιάννης, Κωνσταντίνα")}, icon: {Image(systemName: "person.2.fill")})
                                .font(Typography.bold(size: 16))
                                .foregroundColor(Color.white)
                            Spacer()
                            Label(title: {Text("2024-03-09")}, icon: {Image(systemName: "calendar")})
                                .font(Typography.bold(size: 16))
                                .foregroundColor(Color.white)
                                .labelStyle(TrailingLabelStyle())
                        }
                        .padding(.horizontal)
                        
                        Divider().background(.letterGray).padding()
                        VStack(alignment: .leading){
                            Text("Instructions")
                                .font(Typography.bold(size: 20))
                                .foregroundStyle(.white)
                                .multilineTextAlignment(.leading)
                                .lineLimit(2)
                                .padding(.bottom, 10)
                            
                            Text("Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged.")
                                .font(Typography.regular(size: 16))
                                .foregroundStyle(Color.letterGray)
                                .multilineTextAlignment(.leading)
                            
                        }
                        .padding(.horizontal)
                        Spacer()
                    }
                    
                }
                .ignoresSafeArea()
                .overlay(alignment: .topLeading){
                    backButton
                }
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
//                .toolbar{
//                    ToolbarBackButton {
//                        vm.navigator.goBack()
//                    }
//                    ToolbarTitle(title: "Event Details")
//                }
            }
        }
    }
    
    @ViewBuilder var backButton: some View{
        Button{
            vm.navigator.goBack()
        }label: {
            Image(systemName: "chevron.left")
                .frame(width: 20, height: 20)
                .font(Typography.bold(size: 20))
                .padding(14)
                .foregroundStyle(.black)
                .background(.thinMaterial)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                .shadow(color: .black.opacity(0.3), radius: /*@START_MENU_TOKEN@*/10/*@END_MENU_TOKEN@*/, x: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/, y: /*@START_MENU_TOKEN@*/0.0/*@END_MENU_TOKEN@*/)
                .padding(.horizontal)
        }
        .buttonStyle(PlainButtonStyle())
    }
}



#Preview {
    EventDetailsScreen(event:  BoothifyEvent(id: "1", url: "WWW.FDFD.COM", dateOfEvent: "2024-03-12", phoneNumber: "6980376044", attendance: "200", hours: "4.0", venue: "georgiou 3", region: "Athens", email: "parhsmakrhs@gmail.com", eventType: .wedding, name: "Medicare - Panagiotopoulou", contactSource: "Mobile Phone", schedule: "5–9"))
}
