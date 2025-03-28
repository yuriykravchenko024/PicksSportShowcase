import SwiftUI

struct FavoritesView: View {
    @AppStorage(SaveKey.favoritePlayers) var favoritePlayers: [Player] = []
    @AppStorage(SaveKey.favoriteMoments) var favoriteMoments: [Moment] = []
    
    @State private var mode: FavoritesMode = .players
    
    @Namespace var namespace
    
    var body: some View {
        VStack(spacing: 10) {
            Text("Favorites")
                .font(.ADLaMDisplay(size: 25))
                .foregroundStyle(.white)
                .textCase(.uppercase)
                .multilineTextAlignment(.center)
            
            HStack(spacing: 0) {
                ForEach(FavoritesMode.allCases) { mode in
                    ZStack {
                        if self.mode == mode {
                            ZStack {
                                Capsule()
                                    .fill(LinearGradient(colors: [Color("6D00AF"), Color("7E1DDF")], startPoint: .leading, endPoint: .trailing))
                                
                                Capsule()
                                    .fill(LinearGradient(colors: [Color("9C37FF"), Color("8216CD")], startPoint: .top, endPoint: .bottom))
                            }
                            .matchedGeometryEffect(id: "capsule", in: namespace)
                        }
                        
                        Text(mode.title)
                            .font(.ADLaMDisplay(size: 16))
                            .foreground(self.mode == mode ? "FFFFFF" : "110C51")
                            .textCase(.uppercase)
                    }
                    .frame(width: 120, height: 40)
                    .contentShape(Rectangle())
                    .onTapGesture {
                        self.mode = mode
                    }
                }
            }
            .padding(5)
            .background {
                Capsule().fill(Color.white)
            }
            .animation(.default, value: mode)
            
            switch mode {
            case .players:
                if favoritePlayers.isEmpty {
                    NoFavoritesView()
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVGrid(
                            columns: Array(repeating: .init(spacing: 16), count: 2),
                            spacing: 16
                        ) {
                            ForEach(favoritePlayers) { player in
                                NavigationLink {
                                    PlayerDetailView(player: player)
                                } label: {
                                    PlayerCell(player: player)
                                }
                                .id(player.id)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 100)
                        .animation(.default, value: favoritePlayers)
                    }
                }
            case .moments:
                if favoriteMoments.isEmpty {
                    NoFavoritesView()
                } else {
                    ScrollView(showsIndicators: false) {
                        LazyVStack(spacing: 20) {
                            ForEach(favoriteMoments) { moment in
                                NavigationLink {
                                    MomentDetailView(moment: moment)
                                } label: {
                                    MomentCell(moment: moment)
                                }
                                .id(moment.id)
                            }
                        }
                        .padding(.horizontal, 20)
                        .padding(.bottom, 100)
                        .animation(.default, value: favoriteMoments)
                    }
                }
            }
            
        }
    }
}

enum FavoritesMode: Identifiable, CaseIterable {
    case players
    case moments
    
    var id: Self { self }
    var title: String {
        switch self {
        case .players: "Players"
        case .moments: "Moments"
        }
    }
}

#Preview {
    FavoritesView()
}
