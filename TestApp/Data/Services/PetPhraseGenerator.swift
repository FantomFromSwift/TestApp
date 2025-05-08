
import Foundation

class PetPhraseGenerator {
    func generateRandomPhrase(for pet: PetType) -> String {
        switch pet {
        case .cat:
            return UICatString.allCases.randomElement()!.rawValue
        case .dog:
            return UIDogString.allCases.randomElement()!.rawValue
        }
    }
}
