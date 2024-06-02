//
//  OnBoardingContent.swift
//  Boothify
//
//  Created by Paris Makris on 29/5/24.
//

import SwiftUI

struct OnBoardingContent: View {
    
    @ObservedObject var vm: OnBoardingScreenViewModel
    
    var body: some View {
        GeometryReader{ container in
            ZStack{
                Color.background.ignoresSafeArea()
                VStack{
                    SectionDashedBox(
                        title: "Your Name",
                        description: "Provide your name to bring the right events for you",
                        image: Asset.boothifyLogo.image
                    )
                    .frame(height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
                    .padding(.top, container.safeAreaInsets.top)
                    Spacer().frame(height: 16)
                    LabeledTextField(
                        placeholder: "Provide your name",
                        text: Binding(get: {
                            vm.userName
                        }, set: {
                            vm.userName = $0
                            vm.isTextFieldEmpty()
                        })
                    )
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    
                    Spacer()
                    ActionButton {
                        vm.onNextClicked()
                    } content: {
                        Text("Next")
                    }
                    .disabled(!vm.isNextAllowed)
                    .padding(.bottom)

                }
                .hideKeyboardWhenTappedAround()
                .padding(.horizontal)
                
            }
            
        }
    }
}

#Preview {
    OnBoardingContent(vm: OnBoardingScreenViewModel())
}
