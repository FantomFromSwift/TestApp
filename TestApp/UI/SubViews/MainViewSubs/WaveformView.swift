import SwiftUI
import AVFoundation

struct WaveformView: View {
    @State private var amplitudes: [CGFloat] = Array(repeating: 0.1, count: 50)
    @State private var phase: CGFloat = 0
    var onStopRecording: () -> Void
    @Binding var isRecording: Bool

    var body: some View {
        HStack(alignment: .center, spacing: 4) {
            ForEach(amplitudes.indices, id: \.self) { index in
                RoundedRectangle(cornerRadius: 2)
                    .fill(Color.blue)
                    .frame(width: 2, height: amplitudes[index] * 15 + 5)
                    .scaleEffect(y: 1 + amplitudes[index] * 0.2)
            }
        }
        
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .onTapGesture {
            if isRecording {
                onStopRecording()
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { timer in
                withAnimation(.easeInOut(duration: 0.1)) {
                    for i in amplitudes.indices {
                        let randomChange = CGFloat.random(in: -0.2...0.2)
                        amplitudes[i] = max(0.1, min(1.0, amplitudes[i] + randomChange))
                    }
                    phase += 0.1
                }
            }
        }
    }
}
