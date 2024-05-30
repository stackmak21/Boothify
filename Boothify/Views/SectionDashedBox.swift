//
//  SectionBox.swift
//  Boothify
//
//  Created by Paris Makris on 28/5/24.
//

import SwiftUI

struct SectionDashedBox: View {
    
    let title: String
    let description: String
    let image: UIImage
    
    init(
        title: String,
        description: String,
        image: UIImage
    ) {
        self.title = title
        self.description = description
        self.image = image
    }
    
    
    var body: some View {
        VStack(spacing: 0){
            Group{
                Text(title)
                    .font(Typography.bold(size: 20))
                    .foregroundColor(.letterGreen)
                Spacer().frame(height: 16)
                Text(description)
                    .font(Typography.medium(size: 14))
                    .foregroundColor(.letterGray)
                    .multilineTextAlignment(.center)
            }
            .padding(.horizontal)
        }
        .dashedRectangleWrapper()
        .overlay(alignment: .top){
            CircleIcon
                .offset(y:-30)
        }
    }
    
    @ViewBuilder var CircleIcon: some View {
        Image(uiImage: image)
            .resizable()
            .renderingMode(.template)
            .frame(width: 40, height: 40)
            .padding(10)
            .foregroundStyle(.letterGreen)
            .background(Color.background)
            .clipShape(Circle())
            
    }
}

#Preview {
    ZStack{
        Color.background
        SectionDashedBox(
            title: "Mobile number",
            description: "We require this for security. We will send you a code to confirm your number.",
            image: Asset.boothifyLogo.image
        )
        .padding()
    }
}

struct DashedStrokeStyle: ViewModifier {
    
    let dash: [CGFloat] = [2]
    
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity, maxHeight: 150)
            .overlay{
                RoundedRectangle(cornerRadius: 8)
                    .stroke(Color.activeGreen, style: StrokeStyle(lineWidth: 1, dash: dash))
            }
    }
    
}

extension View{
    
    func dashedRectangleWrapper() -> some View{
        self.modifier(DashedStrokeStyle())
    }
}
