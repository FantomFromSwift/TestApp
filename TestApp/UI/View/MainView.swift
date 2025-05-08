import SwiftUI
import AVFoundation

struct MainView: View {
    @StateObject private var viewModel = MainViewViewModel(audioRecorderManager: AudioRecorderManager.shared)
    @State private var selectedImageName: String = "doggy"
    @State private var selectedPet: PetType = .dog
    @State private var showResultView = false
    @State private var isProcessing = false
    
    var body: some View {
        ZStack(alignment: .top) {
            Background()
            VStack(spacing: 50) {
                LargeText(text: UITitleStrings.translator.rawValue)
                    .opacity(isProcessing ? 0 : 1)
                    .disabled(isProcessing)
                
                SwapWordsView()
                    .opacity(isProcessing ? 0 : 1)
                    .disabled(isProcessing)

                ZStack {
                    if isProcessing {
                        MediumText(text: UITranslatorStrings.processOfTranslation.rawValue)
                    } else {
                        HStack {
                            MicrophoneCell(
                                onTap: { viewModel.startRecording() },
                                isRecording: $viewModel.isRecording,
                                onStopRecording: {
                                    viewModel.finishRecording(pet: selectedPet, audioId: UUID().uuidString)
                                    isProcessing = true
                                    DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
                                        isProcessing = false
                                        showResultView = true
                                    }
                                }
                            )
                            Spacer()
                            PetsCellView(
                                selectedPet: selectedPet,
                                onDogTap: {
                                    selectedPet = .dog
                                    selectedImageName = "doggy"
                                },
                                onCatTap: {
                                    selectedPet = .cat
                                    selectedImageName = "citty"
                                }
                            )
                        }
                        .frame(maxWidth: .infinity)
                        .padding(.horizontal, 45)
                    }
                }
                .frame(height: 80)
                .padding(.top, 50)

                Spacer().frame(height: 10) // 🔼 Увеличенное расстояние

                ImageWithFixedSize(imageName: selectedImageName, width: 184, height: 184)
            }
        }

        .fullScreenCover(isPresented: $showResultView) {
            ResultView(viewModel: ResultViewModel(petImageName: selectedImageName, selectedPet: selectedPet))
        }
    }
}

#Preview {
    MainView()
}
