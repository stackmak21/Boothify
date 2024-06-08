//
//  HomeScreen.swift
//  Boothify
//
//  Created by Paris Makris on 22/5/24.
//

import SwiftUI

struct MyEventsScreen: View {
    
    @ObservedObject var vm: MyEventsScreenViewModel
    
    var body: some View {
        Group{
            MyEventsContent(vm: vm)
        }
    }
    
}


struct MyEventsContent: View {
    
    @ObservedObject var vm: MyEventsScreenViewModel
    @Environment(\.scenePhase) var scenePhase

    
    var body: some View {
        GeometryReader{ container in
            ZStack{
                Color.background.ignoresSafeArea()
                VStack(spacing: 0){
                    if vm.isLoading{
                        ActivityIndicator()
                    }else{
                        
                        ScrollView(.vertical) {
                            LazyVStack{
                                ForEach(vm.events, id: \.self) { event in
                                    Button(
                                        action: {vm.navigator.navigate(.eventDetails(event))},
                                        label: {
                                        MyEventsItem(event: event)
                                                .frame(height: 150)
                                    })
                                    .buttonStyle(PlainButtonStyle())
                                    .padding(.top)
                                    .padding(.horizontal)
                                    .padding(.bottom, 6)
                                }
                            }
                        }
                    }
                }
            }
            .onAppear{
                if vm.events.isEmpty{
                    vm.fetchEvents()
                }
            }
            .onChange(of: scenePhase) { newPhase in
                if newPhase == .active{
                    vm.fetchEvents()
                }
            }
            .navigationBarHidden(true)
        }
    }
}


#Preview {
    MyEventsScreen(vm: MyEventsScreenViewModel())
}
