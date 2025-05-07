//
//  SmallTabView 2.swift
//  TestApp
//
//  Created by Иван Непорадный on 07.05.2025.
//


import SwiftUI

struct LargeTabView: View {
    
    var translatorAction: () -> Void
    var clickerAction: () -> Void
    var soundsAction: () -> Void
    var articlesAction: () -> Void
    
    var body: some View {
        HStack(alignment: .center, spacing: 45) {
            
            // Кнопка Translator
            Button(action: translatorAction) {
                VStack(spacing: 4) {
                    Image("messages-2")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    SmallText(text: UITabStrings.translator.rawValue)
                }
            }

            // Кнопка Clicker
            Button(action: clickerAction) {
                VStack(spacing: 4) {
                    Image("Group-3")
                        .resizable()
                        .frame(width: 24, height: 24)
                    SmallText(text: UITabStrings.clicker.rawValue)
                }
            }

            // Кнопка Sounds
            Button(action: soundsAction) {
                VStack(spacing: 4) {
                    Image("volume-high")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    SmallText(text: UITabStrings.sounds.rawValue)
                }
            }

            // Кнопка Articles
            Button(action: articlesAction) {
                VStack(spacing: 4) {
                    Image("note-2")
                        .resizable()
                        .frame(width: 24, height: 24)
                    
                    SmallText(text: UITabStrings.articles.rawValue)
                }
            }
        }
        .frame(width: 350, height: 82) // Устанавливаем размер ячейки
        .background(Color.white)
        .cornerRadius(16) // Радиус закругления углов
        .shadow(color: Color.black.opacity(0.1), radius: 6, x: 0, y: 3)
    }
}

#Preview {
    LargeTabView(
        translatorAction: { print("Translator tapped") },
        clickerAction: { print("Clicker tapped") },
        soundsAction: { print("Sounds tapped") },
        articlesAction: { print("Articles tapped") }
    )
    .padding()
    .background(Color.gray.opacity(0.1))
}
