import SwiftUI

struct SettingsView: View {
    @StateObject private var viewModel = SettingsViewModel()

    var body: some View {
        NavigationStack {
            ZStack {
                Background()
                VStack(spacing: 20) {
                    ForEach(UISettingStrings.allCases, id: \.self) { setting in
                        if setting == .privacyPolicy || setting == .termsOfUse {
                            // Открытие Safari для Privacy Policy и Terms of Use
                            Link(destination: URL(string: viewModel.getURL(for: setting))!) {
                                ColoredCell(text: setting.rawValue)
                            }
                        } else {
                            // Для остальных — переход на новый экран
                            NavigationLink(destination: viewModel.destinationView(for: setting)) {
                                ColoredCell(text: setting.rawValue)
                            }
                        }
                    }
                }
                .padding(.horizontal)
                .frame(maxHeight: .infinity, alignment: .top)
            }
            .toolbar {
                ToolbarItem(placement: .principal) {
                    LargeText(text: "Settings")
                }
            }
        }
    }
}

#Preview {
    SettingsView()
}
