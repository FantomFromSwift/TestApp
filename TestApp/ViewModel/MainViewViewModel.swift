
import SwiftUI
import UIKit


class MainViewViewModel: ObservableObject {
    private let petPhraseGenerator = PetPhraseGenerator()
    private var audioRecorderManager: AudioRecorderManager
    @Published var isRecording = false
    @Published var translation: String?
    
    
    init(audioRecorderManager: AudioRecorderManager) {
        self.audioRecorderManager = audioRecorderManager
    }


    func startRecording() {
            audioRecorderManager.requestPermission { granted in
                if granted {
                    self.audioRecorderManager.startRecording()
                    self.isRecording = true
                } else {
                    print("Доступ к микрофону отклонен")
                    self.showMicrophoneAccessDeniedAlert()
                    self.isRecording = false
                }
            }
        }
    
    func finishRecording(pet: PetType, audioId: String) {
            audioRecorderManager.stopRecording()
            isRecording = false
            let phrase = petPhraseGenerator.generateRandomPhrase(for: pet)
            saveTranslation(text: phrase, forAnimal: pet.rawValue)
            translation = phrase
        }
    
    func showMicrophoneAccessDeniedAlert() {
        let alert = UIAlertController(
            title: "Enable Microphone Access",
            message: "Please allow access to your mircophone to use the app's features",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(title: "Settings", style: .default, handler: { _ in
            if let appSettings = URL(string: UIApplication.openSettingsURLString) {
                UIApplication.shared.open(appSettings)
            }
        }))
        alert.addAction(UIAlertAction(title: "Cancel", style: .cancel))

        
        if let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene {
            if let topController = scene.windows.first(where: { $0.isKeyWindow })?.rootViewController {
                topController.present(alert, animated: true, completion: nil)
            }
        }
    }
    
    private func saveTranslation(text: String, forAnimal animal: String) {
        let key = "translations_\(animal)" // например: translations_cat
        var translations = UserDefaultsManager.shared.load(forKey: key, as: [String].self) ?? []
        translations.append(text)
        UserDefaultsManager.shared.save(translations, forKey: key)
    }
}
