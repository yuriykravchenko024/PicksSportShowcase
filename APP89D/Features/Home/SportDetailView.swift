import SwiftUI

struct SportDetailView: View {
    let sport: Sport
    
    private var players: [Player] {
        return Player.allPlayers
            .filter { $0.sport == sport }
            .sorted { $0.id < $1.id }
    }
    
    var body: some View {
        VStack(spacing: 10) {
            ZStack {
                BackButton()
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 10)
                
                Text("\(sport.title)\nPLAYERS")
                    .font(.ADLaMDisplay(size: 25))
                    .foregroundStyle(.white)
                    .textCase(.uppercase)
                    .multilineTextAlignment(.center)
            }
            
            ScrollView(showsIndicators: false) {
                LazyVGrid(
                    columns: Array(repeating: .init(spacing: 16), count: 2),
                    spacing: 16
                ) {
                    ForEach(players) { player in
                        NavigationLink {
                            PlayerDetailView(player: player)
                        } label: {
                            PlayerCell(player: player)
                            .id(player.id)
                        }
                    }
                }
                .padding(.horizontal, 20)
                .padding(.bottom, 100)
            }
        }
        .background {
            Image(.bg)
                .scaleAspectFill()
                .ignoresSafeArea()
        }
        .hideSystemNavBar()
    }
}

#Preview {
    SportDetailView(sport: .soccer)
}
