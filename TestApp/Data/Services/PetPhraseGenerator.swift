//
//  PetPhraseGenerator.swift
//  TestApp
//
//  Created by Иван Непорадный on 07.05.2025.
//


import Foundation

class PetPhraseGenerator {
    /// Генерация случайной фразы для выбранного питомца
    /// - Parameter pet: Тип животного
    /// - Returns: Сгенерированная фраза
    func generateRandomPhrase(for pet: PetType) -> String {
        switch pet {
        case .cat:
            return UICatString.allCases.randomElement()!.rawValue
        case .dog:
            return UIDogString.allCases.randomElement()!.rawValue
        }
    }
}
