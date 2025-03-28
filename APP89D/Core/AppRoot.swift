import SwiftUI

struct AppRoot: View {
    @State private var isLoading = true
    
    var body: some View {
        ZStack {
            if isLoading {
                PreloaderView()
                    .onAppear {
                        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                            isLoading = false
                        }
                    }
            } else {
                NavigationStack {
                    TabBarView()
                }
            }
        }
        .dynamicTypeSize(.large)
        .buttonStyle(.plain)
        .lockOrientation(.portrait)
        .animation(.default, value: isLoading)
    }
}
