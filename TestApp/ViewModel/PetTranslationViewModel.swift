//
//  PetTranslationViewModel.swift
//  TestApp
//
//  Created by Иван Непорадный on 07.05.2025.
//
import SwiftUI


class PetTranslationViewModel: ObservableObject {
    private let petPhraseGenerator = PetPhraseGenerator()
    private var audioRecorderManager: AudioRecorderManager
    
    // Свойства для отображения состояния записи
    @Published var isRecording = false
    @Published var translation: String?
    
    init(audioRecorderManager: AudioRecorderManager) {
        self.audioRecorderManager = audioRecorderManager
    }

    /// Начинает запись
    func startRecording() {
        audioRecorderManager.startRecording()
        isRecording = true
    }
    
    /// Останавливает запись и генерирует перевод
    func finishRecording(pet: PetType, audioId: String) {
        // Останавливаем запись
        audioRecorderManager.stopRecording()
        isRecording = false
        
        // Генерируем случайную фразу для питомца
        let phrase = petPhraseGenerator.generateRandomPhrase(for: pet)
        
        // Сохраняем перевод
        saveTranslation(text: phrase, forAnimal: pet.rawValue)
        
        // Обновляем UI
        translation = phrase
    }
    
    /// Сохраняет перевод в UserDefaults
    private func saveTranslation(text: String, forAnimal animal: String) {
        let key = "translations_\(animal)" // например: translations_cat
        var translations = UserDefaultsManager.shared.load(forKey: key, as: [String].self) ?? []
        translations.append(text)
        UserDefaultsManager.shared.save(translations, forKey: key)
    }
}
