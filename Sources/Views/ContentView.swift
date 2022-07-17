//
//  ContentView.swift
//  TestApp_ViktorIvanov
//
//  Created by anduser on 14.07.2022.
//

import SwiftUI

struct ContentView: View {
    
    @StateObject private var model = RandomStringViewModel()
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack {
            Color.orange.ignoresSafeArea()
            
            VStack {
                Text(Constatns.title)
                    .font(
                        Font.system(
                            size: Constatns.titleTextSize,
                            weight: .bold,
                            design: .rounded
                        )
                    )
                    .multilineTextAlignment(.center)
                
                Spacer()
                    .frame(height: 50)
                
                TextView(text: $model.resultMessage)
                    .background(Color.yellow)
                    .cornerRadius(.defaultRadius)
                    .overlay(
                        RoundedRectangle(cornerRadius: .defaultRadius)
                            .stroke(Color.white, lineWidth: 5)
                    )
                    .padding(.horizontal)
                    .focused($isFocused)
                
                
                Spacer()
                    .frame(height: 50)
                
                Button(Constatns.saveButtonTitle) {
                    model.saveString(model.resultMessage)
                }
                .frame(
                    width: Constatns.buttonWidth,
                    height: Constatns.buttonHeight
                )
                .background(Color.black)
                .foregroundColor(Color.white)
                .font(
                    Font.system(
                        size: Constatns.buttonTextSize,
                        weight: .heavy,
                        design: .rounded
                    )
                )
                .cornerRadius(.defaultRadius)
                .overlay(
                    RoundedRectangle(cornerRadius: .defaultRadius)
                        .stroke(Color.white, lineWidth: 3)
                )
            }
        }
        .onAppear {
            model.onAppear()
        }
        .onTapGesture {
            isFocused = false
        }
    }
}

// MARK: - Constants

private extension ContentView {
    
    enum Constatns {
        static let title = "Viktor Ivanov test app"
        static let titleTextSize: CGFloat = 45
        static let saveButtonTitle = "Save"
        static let reloadButtonTitle = "Reload"
        static let buttonHeight: CGFloat = 50
        static let buttonTextSize: CGFloat = 25
        static let buttonWidth = UIScreen.main.bounds.width - 100
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
