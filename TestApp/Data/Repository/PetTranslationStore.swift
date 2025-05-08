
import Foundation

final class PetTranslationStore {
    
    static let shared = PetTranslationStore()
    
    
    private let catKey = "catTranslations"
    private let dogKey = "dogTranslations"
    
    
    private init() {}
    
    func saveTranslation(for pet: PetType, audioId: String, phrase: String) {
        var current = loadTranslations(for: pet)
        current[audioId] = phrase
        saveTranslations(current, for: pet)
    }
    
    func loadTranslations(for pet: PetType) -> [String: String] {
        let key = pet == .cat ? catKey : dogKey
        
        if let data = UserDefaults.standard.data(forKey: key),
           let dictionary = try? JSONDecoder().decode([String: String].self, from: data) {
            return dictionary
        }
        return [:]
    }
    
    private func saveTranslations(_ dictionary: [String: String], for pet: PetType) {
        let key = pet == .cat ? catKey : dogKey
        
        if let data = try? JSONEncoder().encode(dictionary) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
