import SwiftUI

struct SwapWordsView: View {
    @State private var isSwapped = false
    
    var body: some View {
        HStack(spacing: 20) {
            // Слова, которые можно менять местами
            Button(action: {
                // Переключаем местами слова
                isSwapped.toggle()
            }) {
                MediumText(text: isSwapped ? UITranslatorStrings.pat.rawValue : UITranslatorStrings.human.rawValue)
                    .frame(width: 135, height: 61) // Устанавливаем размеры для кнопки с текстом
            }

            // Кнопка между словами для обмена
            Button(action: {
                // Переключаем местами слова
                isSwapped.toggle()
            }) {
                Image("arrow-swap-horizontal") // Стрелка между словами
                    .resizable()
                    .frame(width: 24, height: 24)
                    .padding(5)
            }
            
            Button(action: {
                // Переключаем местами слова
                isSwapped.toggle()
            }) {
                MediumText(text: isSwapped ? UITranslatorStrings.human.rawValue : UITranslatorStrings.pat.rawValue)
                    .frame(width: 135, height: 61) // Устанавливаем размеры для кнопки с текстом
            }
        }
        .frame(maxWidth: .infinity) // Устанавливаем ширину и высоту HStack
        .background(Color.clear) // Делаем HStack прозрачным
        .padding(.horizontal, 40)
    }
}

#Preview {
    SwapWordsView()
}
