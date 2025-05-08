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
                            Link(destination: URL(string: viewModel.getURL(for: setting))!) {
                                ColoredCell(text: setting.rawValue)
                            }
                        } else {
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
