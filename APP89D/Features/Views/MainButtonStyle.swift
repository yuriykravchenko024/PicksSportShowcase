import SwiftUI

struct MainButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        ZStack {
            Capsule()
                .fill(LinearGradient(colors: [Color("6D00AF"), Color("7E1DDF")], startPoint: .leading, endPoint: .trailing))
            
            Capsule()
                .fill(LinearGradient(colors: [Color("9C37FF"), Color("8216CD")], startPoint: .top, endPoint: .bottom))

            configuration.label
                .font(.ADLaMDisplay(size: 24))
                .foregroundStyle(.white)
                .textCase(.uppercase)
        }
        .frame(height: 50)
        .scaleEffect(configuration.isPressed ? 0.9 : 1)
    }
}

extension ButtonStyle where Self == MainButtonStyle {
    static var main: Self { .init() }
}

#Preview {
    Button("Title", action: {})
        .buttonStyle(.main)
}
