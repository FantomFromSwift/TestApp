
import SwiftUI

class SettingsViewModel: ObservableObject {
    // Функция для получения URL для перехода на страницы (PrivacyPolicy, TermsOfUse)
    func getURL(for setting: UISettingStrings) -> String {
        switch setting {
        case .privacyPolicy:
            return "https://www.testapp.com/privacy-policy"
        case .termsOfUse:
            return "https://www.twstapp.com/terms"
        default:
            return ""
        }
    }

    // Функция для создания экрана для каждой кнопки
    func destinationView(for setting: UISettingStrings) -> some View {
        switch setting {
        case .rateUs:
            return AnyView(Text("Rate Us Screen"))
        case .shareApp:
            return AnyView(Text("Share App Screen"))
        case .contactUs:
            return AnyView(Text("Contact Us Screen"))
        case .restorePurchase:
            return AnyView(Text("Restore Purchase Screen"))
        default:
            return AnyView(EmptyView())
        }
    }
}
