//
//  NewEventsScreen.swift
//  Boothify
//
//  Created by Paris Makris on 2/6/24.
//

import SwiftUI

struct NewEventsScreen: View {
    @StateObject var vm = NewEventsViewModel()
    
    var body: some View {
        NewEventsContent(vm: vm)
    }
}

struct NewEventsContent: View {
    
    @ObservedObject var vm: NewEventsViewModel
    
    var body: some View {
        /*@START_MENU_TOKEN@*//*@PLACEHOLDER=Hello, world!@*/Text("Hello, world!")/*@END_MENU_TOKEN@*/
    }
}

#Preview {
    NewEventsScreen()
}
