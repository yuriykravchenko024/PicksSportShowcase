import SwiftUI

struct AppRoot: View {
    @UIApplicationDelegateAdaptor(AppDelegate.self) var appDelegate
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
        .animation(.default, value: isLoading)
        .onAppear {
            AppDelegate.orientationLock = .portrait
            UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
            UINavigationController.attemptRotationToDeviceOrientation()
        }
    }
}
