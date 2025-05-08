
import AVFoundation
import Foundation

final class AudioRecorderManager: ObservableObject {
    static let shared = AudioRecorderManager()
    let petPhraseGenerator = PetPhraseGenerator()

    private var audioEngine: AVAudioEngine?
    private var inputNode: AVAudioInputNode?

    @Published var isRecording = false

    private init() {}

    
    func requestPermission(completion: @escaping (Bool) -> Void) {
        if #available(iOS 17.0, *) {
            AVAudioApplication.requestRecordPermission { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }
        } else {
            AVAudioSession.sharedInstance().requestRecordPermission { granted in
                DispatchQueue.main.async {
                    completion(granted)
                }
            }
        }
    }

    
    func startRecording() {
        let audioSession = AVAudioSession.sharedInstance()

        do {
            try audioSession.setCategory(.record, mode: .default)
            try audioSession.setActive(true, options: .notifyOthersOnDeactivation)

            audioEngine = AVAudioEngine()
            guard let audioEngine = audioEngine else { return }

            inputNode = audioEngine.inputNode
            let format = inputNode!.outputFormat(forBus: 0)

            
            inputNode?.installTap(onBus: 0, bufferSize: 1024, format: format) { _, _ in
                
            }

            audioEngine.prepare()
            try audioEngine.start()
            isRecording = true

        } catch {
            print("Ошибка при запуске записи: \(error.localizedDescription)")
        }
    }
    
    
    func stopRecording() {
        inputNode?.removeTap(onBus: 0)
        audioEngine?.stop()
        isRecording = false
}
}
