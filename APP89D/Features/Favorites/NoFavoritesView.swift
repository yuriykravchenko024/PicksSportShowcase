import SwiftUI

struct NoFavoritesView: View {
    var body: some View {
        Text("Your favorites list is empty.")
            .font(.ADLaMDisplay(size: 20))
            .foregroundStyle(.white)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}

#Preview {
    NoFavoritesView()
}
