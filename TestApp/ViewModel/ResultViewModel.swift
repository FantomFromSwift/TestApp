
import SwiftUI

class ResultViewModel: ObservableObject {
    let petImageName: String
    @Published var generatedText: String = ""
    let selectedPet: PetType

    private let petPhraseGenerator = PetPhraseGenerator()

    init(petImageName: String, selectedPet: PetType) {
        self.petImageName = petImageName
        self.selectedPet = selectedPet
        generatePhrase()
    }

    private func generatePhrase() {
        generatedText = petPhraseGenerator.generateRandomPhrase(for: selectedPet)
    }
}
