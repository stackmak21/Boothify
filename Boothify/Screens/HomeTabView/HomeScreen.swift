//
//  HomeScreen.swift
//  WrenchWizard
//
//  Created by Paris Makris on 10/2/24.
//

import SwiftUI

struct HomeScreen: View {
    
    @StateObject private var homeViewModel: HomeViewModel = HomeViewModel()
    @StateObject var myEventsViewModel: MyEventsScreenViewModel = MyEventsScreenViewModel()
    
    var body: some View {
            VStack(spacing: 0) {
                navigationTopBar
                GeometryReader { container in
                ZStack {
                    switch homeViewModel.activeTab {
                    case .myEvents:
                        MyEventsScreen(vm: myEventsViewModel)
                    case .newEvents:
                        NewEventsScreen()
                    }
                }
                .allowSwipeBack(allow: false)
                .padding(.leading, container.safeAreaInsets.leading)
                .padding(.trailing, container.safeAreaInsets.trailing)
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
            }
           bottomTabBar
            }
            .navigationBarHidden(true)
            .edgesIgnoringSafeArea([.leading, .trailing, .bottom])
            .allowSwipeBack(allow: false)
    }
    
    @ViewBuilder var navigationTopBar: some View {
        HStack{
            Image(uiImage: Asset.boothifyLogo.image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 150, height: 50, alignment: .leading)
            Spacer()
            Button(
                action: {
                    homeViewModel.navigator.navigate(.settings)
                },
                label: {
                    Image(systemName: "gear")
                        .resizable()
                        .renderingMode(.template)
                        .frame(width: 30, height: 30)
                        .foregroundColor(Color.activeGreen)
                })
            .buttonStyle(PlainButtonStyle())
        }
        .padding(.horizontal)
        .background(Color.backgroundNight.ignoresSafeArea().shadow(length: .long))
        .zIndex(1)
    }
    
    @ViewBuilder var bottomTabBar: some View{
        HStack {
            Spacer()
            TabItem(
                title: "My Events",
                image: Image(systemName: "doc.text.fill"),
                isNotificationVisible: false,
                isSelected: homeViewModel.activeTab == .myEvents
            )
            .onTapGesture {
                homeViewModel.activeTab = .myEvents
            }
            Spacer()
            TabItem(
                title: "New Events",
                image: Image(systemName: "calendar.badge.plus"),
                isNotificationVisible: false,
                isSelected: homeViewModel.activeTab == .newEvents
            )
            .onTapGesture {
                homeViewModel.activeTab = .newEvents
            }
            Spacer()
          
        }
        .ignoresSafeArea(.keyboard)
        .frame(maxWidth: .infinity)
        .frame(height: 70)
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .padding(.bottom)
        .background(Color.backgroundNight.shadow(length: .long))
        .zIndex(1)
    }
}

private struct TabItem: View {
    
    var title: String
    var image: Image
    var isNotificationVisible: Bool
    var isSelected: Bool
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            VStack(spacing: 6) {
                image
                    .renderingMode(.template)
                Text(title)
                    .font(Typography.regular(size: 12))
            }
            .foregroundColor(color)
            if isNotificationVisible {
                Circle()
                    .fill(Color.red)
                    .frame(width: 6, height: 6)
            }
        }
    }
    
    private var color: Color {
        if isSelected {
            return Color.letterGreen
        } else {
            return Color.letterGreen.opacity(0.5)
        }
    }
}

#Preview {
    HomeScreen()
}
