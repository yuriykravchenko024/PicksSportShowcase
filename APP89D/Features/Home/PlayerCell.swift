import SwiftUI

struct PlayerCell: View {
    let player: Player
    
    @AppStorage(SaveKey.favoritePlayers) var favoritePlayers: [Player] = []
    
    private var isFavorited: Bool {
        return favoritePlayers.contains { $0.id == player.id }
    }
    
    var body: some View {
        VStack(spacing: 5) {
            Image(player.imageName)
                .scaleAspectFill()
                .clipShape(Circle())
                .frame(width: 80, height: 80)
                .overlay {
                    Circle().strokeBorder(Color.white.opacity(0.44), lineWidth: 1)
                }
                .frame(maxWidth: .infinity)
                .overlay(alignment: .topTrailing) {
                    Button {
                        if isFavorited {
                            if let index = favoritePlayers.firstIndex(of: player) {
                                favoritePlayers.remove(at: index)
                            }
                        } else {
                            favoritePlayers.append(player)
                        }
                    } label: {
                        Image(isFavorited ? .heartOn : .heartOff)
                            .resizable()
                            .frame(width: 26, height: 26)
                    }
                }
            
            Text(player.name)
                .font(.ADLaMDisplay(size: 15))
                .multilineTextAlignment(.center)
            
            Text(player.bio)
                .font(.arial(size: 12))
                .lineSpacing(3)
                .lineLimit(6)
        }
        .foregroundStyle(.white)
        .padding(.top, 10)
        .padding(.horizontal, 10)
        .padding(.bottom, 15)
        .frame(maxHeight: 240, alignment: .top)
        .background {
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(LinearGradient(colors: [Color("1234E9"), Color("9F1CFF")], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .opacity(0.58)
                
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color("9C36FF"), lineWidth: 1)
            }
        }
    }
}

#Preview {
    SportDetailView(sport: .mma)
}
