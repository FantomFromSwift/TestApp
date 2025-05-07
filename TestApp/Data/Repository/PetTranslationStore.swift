
import Foundation

final class PetTranslationStore {
    /// Синглтон для глобального доступа
    static let shared = PetTranslationStore()
    
    /// Ключи для хранения словарей в UserDefaults
    private let catKey = "catTranslations"
    private let dogKey = "dogTranslations"
    
    /// Приватный инициализатор для синглтона
    private init() {}
    
    /// Сохраняет перевод для конкретной записи и животного
    /// - Parameters:
    ///   - pet: Тип животного (кошка или собака)
    ///   - audioId: Уникальный идентификатор аудиозаписи (например, UUID или путь)
    ///   - phrase: Сгенерированная фраза (перевод)
    func saveTranslation(for pet: PetType, audioId: String, phrase: String) {
        var current = loadTranslations(for: pet)  // Загружаем текущие переводы
        current[audioId] = phrase                 // Добавляем или обновляем запись
        saveTranslations(current, for: pet)       // Сохраняем обновлённый словарь
    }
    
    /// Загружает все переводы для указанного питомца
    /// - Parameter pet: Тип животного
    /// - Returns: Словарь переводов (аудиоID → фраза)
    func loadTranslations(for pet: PetType) -> [String: String] {
        let key = pet == .cat ? catKey : dogKey
        
        if let data = UserDefaults.standard.data(forKey: key),
           let dictionary = try? JSONDecoder().decode([String: String].self, from: data) {
            return dictionary
        }
        return [:] // Возвращаем пустой словарь, если данных нет
    }
    
    /// Внутренний метод для сохранения словаря переводов в UserDefaults
    /// - Parameters:
    ///   - dictionary: Обновлённый словарь переводов
    ///   - pet: Тип животного
    private func saveTranslations(_ dictionary: [String: String], for pet: PetType) {
        let key = pet == .cat ? catKey : dogKey
        
        if let data = try? JSONEncoder().encode(dictionary) {
            UserDefaults.standard.set(data, forKey: key)
        }
    }
}
