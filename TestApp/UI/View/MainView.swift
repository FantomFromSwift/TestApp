import SwiftUI
import AVFoundation

struct MainView: View {
    @StateObject private var viewModel = MainViewViewModel(audioRecorderManager: AudioRecorderManager.shared)
    @State private var selectedImageName: String = "doggy"
    @State private var selectedPet: PetType = .dog
    @State private var showResultView = false
    
    var body: some View {
        ZStack (alignment: .top){
            Background()
            VStack(spacing: 50) {
                LargeText(text: UITitleStrings.translator.rawValue)
                SwapWordsView()
                HStack {
                    MicrophoneCell(
                        onTap: {
                            viewModel.startRecording()
                        },
                        isRecording: $viewModel.isRecording,
                        onStopRecording: { 
                            viewModel.finishRecording(pet: selectedPet, audioId: UUID().uuidString)
                            showResultView = true
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
