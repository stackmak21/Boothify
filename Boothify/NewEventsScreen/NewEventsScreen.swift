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
        GeometryReader{ container in
            ZStack{
                Color.background.ignoresSafeArea()
                VStack(spacing: 0){

                    ScrollView(.vertical) {
                        ForEach(1..<10) { i in
                            NewEventsItem()
                                .padding(.top)
                                .padding(.horizontal)
                                .padding(.bottom, 6)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    NewEventsScreen()
}
