//
//  SettingsScreen.swift
//  Boothify
//
//  Created by Paris Makris on 8/6/24.
//

import SwiftUI

struct SettingsScreen: View {
    @StateObject var vm = SettingsScreenViewModel()
    
    var body: some View {
        SettingsContent(vm: vm)
    }
}

struct SettingsContent: View {
    
    @ObservedObject var vm: SettingsScreenViewModel
    
    var body: some View {
        ZStack{
            Color.background.ignoresSafeArea()
            VStack{
                SectionItem(
                    label: "User ID",
                    title: vm.userID
                )
                .padding(.vertical, 10)
                Divider().background(Color.letterGray.opacity(0.6))
                Button {
                    vm.navigator.navigate(.onBoarding)
                } label: {
                    SectionItem(
                        title: "Change User ID",
                        action: { ClickSectionAction() }
                    )
                }
                .padding(.vertical, 10)
                Divider().background(Color.letterGray.opacity(0.6))
                SectionItem(
                    label: "Version",
                    title: "1.0.0"
                )
                .padding(.vertical, 10)
                Spacer()
            }
            .padding()
        }
        .navigationBarBackButtonHidden(true)
        .toolbar{
            ToolbarBackButton {
                vm.navigator.goBack()
            }
            ToolbarTitle(title: "Settings")
        }
        .onAppear{
            vm.getUserID()
        }
    }
}

#Preview {
    SettingsScreen()
}
