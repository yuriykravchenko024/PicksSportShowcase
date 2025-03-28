import SwiftUI

struct HomeView: View {
    var body: some View {
        VStack(spacing: 10) {
            Text("Sports\nCategories")
                .font(.ADLaMDisplay(size: 25))
                .foregroundStyle(.white)
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(
                    columns: Array(repeating: .init(spacing: 16), count: 2),
                    spacing: 16
                ) {
                    ForEach(Sport.allCases) { sport in
                        NavigationLink {
                            SportDetailView(sport: sport)
                        } label: {
                            Image(sport.imageName)
                                .resizable()
                                .scaledToFit()
                        }
                        .id(sport.id)
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
        }
    }
}

#Preview {
    TabBarView()
}
