//
//  PageIntro.swift
//  OnboardingScreenSwiftUI
//
//  Created by Yade KANBİR on 20.06.2023.
//

import SwiftUI

struct PageIntro: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        if currentPage > totalPages {
            Home()
        } else {
            WalkthroughScreen()
        }
    }
}

struct PageIntro_Previews: PreviewProvider {
    static var previews: some View {
        PageIntro()
    }
}

struct Home: View {
    var body: some View {
        VStack{
            Image("image5")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 300)
            
            Text("Let's go on vocation!")
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
        }
    }
}

struct WalkthroughScreen: View {
    @AppStorage("currentPage") var currentPage = 1
    var body: some View {
        ZStack{
            if currentPage == 1 {
                ScreenView(image: "image1", title: "Step1", detail: "Lorem Ipsum is simply dummy text of the printing and typesetting industry.", bgColor: .clear)
                    .transition(.scale)
            }
            
            if currentPage == 2 {
                ScreenView(image: "image2", title: "Step2", detail: "Contrary to popular belief, Lorem Ipsum is not simply random text. ", bgColor: .white)
                    .transition(.scale)
            }
            
            if currentPage == 3 {
                ScreenView(image: "image4", title: "Step3", detail: "It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout.", bgColor: .white)
                    .transition(.scale)
            }
        }
        .overlay{
            Button(action: {
                withAnimation(.easeInOut) {
                    if currentPage <= totalPages {
                        currentPage += 1
                    } else {
                        currentPage = 1
                    }
                }
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 20, weight: .semibold))
                    .foregroundColor(.black)
                    .frame(width: 60, height: 60)
                    .background(Color.teal)
                    .clipShape(Circle())
                    .overlay {
                        ZStack{
                            Circle()
                                .stroke(Color.black.opacity(0.04), lineWidth: 4)
                            Circle()
                                .trim(from: 0, to: CGFloat(currentPage) / CGFloat(totalPages))
                                .stroke(Color.black, lineWidth: 4)
                                .rotationEffect(.init(degrees: -90))
                        }
                        .padding(-15)
                    }
            })
            .padding(.top, 640)
        }
    }
}

struct ScreenView: View {
    var image: String
    var title: String
    var detail: String
    var bgColor: Color
    
    @AppStorage("currentPage") var currentPage = 1
    
    var body: some View {
        VStack(spacing: 20) {
            HStack{
                if currentPage == 1 {
                    Text("Hello Member!")
                        .font(.title)
                        .fontWeight(.semibold)
                        .kerning(1.4)
                } else {
                    Button(action: {
                        withAnimation(.easeInOut){
                            currentPage -= 1
                        }
                    }, label: {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding(.vertical, 10)
                            .padding(.horizontal)
                            .background(Color.black.opacity(0.4))
                            .cornerRadius(10)
                    })
                }
                
                Spacer()
                
                Button(action: {
                    withAnimation(.easeInOut) {
                        currentPage = 4
                    }
                }, label: {
                    Text("Skip")
                        .fontWeight(.semibold)
                        .kerning(1.3)
                })
            }
            .foregroundColor(.black)
            .padding()
            
            Spacer(minLength: 0)
            
            Image(image)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 325)
            
            Text(title)
                .font(.title)
                .fontWeight(.bold)
                .padding(.top)
            
            Text(detail)
                .fontWeight(.semibold)
                .kerning(1.3)
                .multilineTextAlignment(.center)
            
            Spacer(minLength: 120)
        }
        .background(bgColor.ignoresSafeArea())
    }
}

var totalPages = 3
