//
//  OnBoardingContent.swift
//  Boothify
//
//  Created by Paris Makris on 29/5/24.
//

import SwiftUI

struct OnBoardingContent: View {
    
    @StateObject var vm =  OnBoardingScreenViewModel()
    
    var body: some View {
        GeometryReader{ container in
            ZStack{
                Color.background.ignoresSafeArea()
                VStack{
                    SectionDashedBox(
                        title: "Your ID",
                        description: "Please insert your Boothify ID",
                        image: Asset.boothifyLogo.image
                    )
                    .frame(height: 120)
                    .padding(.top, container.safeAreaInsets.top)
                    Spacer().frame(height: 16)
                    LabeledTextField(
                        placeholder: "Insert your Boothify ID here...",
                        text: Binding(get: {
                            vm.userId
                        }, set: {
                            vm.userId = $0
                            vm.isTextFieldEmpty()
                        })
                    )
                    .autocorrectionDisabled()
                    .autocapitalization(.none)
                    
                    Spacer()
                    ActionButton {    
                        vm.onClick()
                    } content: {
                        Text(vm.isEditMode ? "Save" : "Next")
                    }
                    .disabled(!vm.isNextAllowed)
                    .padding(.bottom)

                }
                .onAppear{
                    vm.getUserID()
                }
                .hideKeyboardWhenTappedAround()
                .navigationBarBackButtonHidden(true)
                .navigationBarHidden(true)
                .padding(.horizontal)
                
            }
            
        }
    }
}

#Preview {
    OnBoardingContent(vm: OnBoardingScreenViewModel())
}
