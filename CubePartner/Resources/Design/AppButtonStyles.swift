import SwiftUI

extension ButtonStyle where Self == AppButtonDefaultStyle {
    static var appButtonDefaultStyle: AppButtonDefaultStyle { .init() }
    static var appButtonSecondaryStyle: AppButtonSecondaryStyle { .init() }
    static var appButtonShortDefaultStyle: AppButtonShortDefaultStyle { .init() }
    static var appButtonShortSecondaryStyle: AppButtonShortSecondaryStyle { .init() }
    static var appButtonLinkStyle: AppButtonLinkStyle { .init() }
}

struct AppButtonDefaultStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 40)
            .padding(
                EdgeInsets(
                    top: AppSpace.xSmall, 
                    leading: AppSpace.xMedium, 
                    bottom: AppSpace.xSmall, 
                    trailing: AppSpace.xMedium
                )
            )
            .appFont(.body, weight: .bold)
            .foregroundStyle(.appOnPrimary)
            .background(
                RoundedRectangle(cornerRadius: AppBorder.radius.small)
                    .fill(.appPrimary)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

struct AppButtonSecondaryStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(maxWidth: .infinity, minHeight: 40)
            .padding(
                EdgeInsets(
                    top: AppSpace.xSmall, 
                    leading: AppSpace.xMedium, 
                    bottom: AppSpace.xSmall, 
                    trailing: AppSpace.xMedium
                )
            )
            .appFont(.body, weight: .bold)
            .foregroundStyle(.appOnSecondary)
            .background(
                RoundedRectangle(cornerRadius: AppBorder.radius.small)
                    .fill(.appSecondary)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

struct AppButtonShortDefaultStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 30, minHeight: 40)
            .padding(
                EdgeInsets(
                    top: AppSpace.xSmall, 
                    leading: AppSpace.xMedium, 
                    bottom: AppSpace.xSmall, 
                    trailing: AppSpace.xMedium
                )
            )
            .appFont(.body, weight: .bold)
            .foregroundStyle(.appOnPrimary)
            .background(
                RoundedRectangle(cornerRadius: AppBorder.radius.small)
                    .fill(.appPrimary)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

struct AppButtonShortSecondaryStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .frame(minWidth: 30, minHeight: 40)
            .padding(
                EdgeInsets(
                    top: AppSpace.xSmall, 
                    leading: AppSpace.xMedium, 
                    bottom: AppSpace.xSmall, 
                    trailing: AppSpace.xMedium
                )
            )
            .appFont(.body, weight: .bold)
            .foregroundStyle(.appOnSecondary)
            .background(
                RoundedRectangle(cornerRadius: AppBorder.radius.small)
                    .fill(.appSecondary)
            )
            .scaleEffect(configuration.isPressed ? 0.9 : 1)
            .animation(.smooth, value: configuration.isPressed)
    }
}

struct AppButtonLinkStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .appFont(.body, weight: .bold)
            .underline(color: .appPrimary)
            .foregroundStyle(.appText)
    }
}

