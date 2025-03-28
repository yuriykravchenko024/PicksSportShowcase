import SwiftUI

struct PlayerDetailView: View {
    let player: Player
    
    @State private var popupText: String?
    
    @AppStorage(SaveKey.favoritePlayers) var favoritePlayers: [Player] = []
    
    private var isFavorited: Bool {
        return favoritePlayers.contains { $0.id == player.id }
    }
    
    var body: some View {
        ZStack {
            content
                
            if let popupText = popupText {
                Color.black.opacity(0.4)
                    .ignoresSafeArea()
                    .zIndex(1)
                    .onTapGesture {
                        self.popupText = nil
                    }
                
                VStack {
                    Button {
                        self.popupText = nil
                    } label: {
                        Image(systemName: "xmark")
                            .resizable()
                            .foregroundStyle(.white)
                            .padding(10)
                            .frame(width: 40, height: 40)
                    }
                    .frame(maxWidth: .infinity, alignment: .trailing)

                    Text(popupText)
                        .font(.arial(size: 14))
                        .foregroundStyle(.white)
                        .lineSpacing(3)
                        .padding(.bottom, 20)
                }
                .padding(20)
                .background {
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(LinearGradient(colors: [Color("1234E9"), Color("9F1CFF")], startPoint: .bottomLeading, endPoint: .topTrailing))
                        RoundedRectangle(cornerRadius: 15)
                            .strokeBorder(Color("9C36FF"), lineWidth: 1)
                    }
                }
                .frame(maxHeight: .infinity, alignment: .bottom)
                .ignoresSafeArea()
                .zIndex(2)
                .transition(.move(edge: .bottom))
            }
        }
        .hideSystemNavBar()
        .animation(.default, value: popupText)
        .animation(.default, value: isFavorited)
    }
    
    private var content: some View {
        VStack(spacing: 16) {
            BackButton()
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 10)
                .padding(.top, 10)
            
            ScrollView {
                VStack(spacing: 10) {
                    Image(player.imageName)
                        .scaleAspectFill()
                        .frame(height: 200)
                        .clipShape(RoundedRectangle(cornerRadius: 20))
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .strokeBorder(Color("9C36FF"), lineWidth: 1)
                        }
                        .padding(.horizontal, 20)
                    
                    Text(player.name)
                        .font(.ADLaMDisplay(size: 22))
                    
                    let stats = PlayerStatisticsFactory.statisticsForPlayer(id: player.id)
                    if !stats.isEmpty {
                        Text("Statistics")
                            .font(.arial(size: 16))
                        
                        VStack(spacing: 0) {
                            statisticsRow(year: "Year", goals: "Goals", championships: "Championships", goldenBall: "Golden Ball", matches: "Matches")
                                .font(.arial(size: 12))
                            
                            ForEach(stats.indices, id: \.self) { index in
                                let stat = stats[index]
                                statisticsRow(
                                    year: String(stat.year),
                                    goals: String(stat.goals),
                                    championships: String(stat.championships),
                                    goldenBall: stat.goldenBall ? "1" : "0",
                                    matches: String(stat.matches)
                                )
                                .background {
                                    Color.white.opacity(0.15)
                                        .opacity(index % 2 == 0 ? 1 : 0)
                                }
                            }
                            .font(.arial(size: 12))
                        }
                        .background {
                            ZStack {
                                RoundedRectangle(cornerRadius: 15)
                                    .fill(LinearGradient(colors: [Color("1234E9"), Color("9F1CFF")], startPoint: .bottomLeading, endPoint: .topTrailing))
                                    .opacity(0.58)
                                
                                RoundedRectangle(cornerRadius: 15)
                                    .strokeBorder(Color("9C36FF"), lineWidth: 1)
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    
                    Text("News")
                        .font(.arial(size: 16))

                    
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 10) {
                            ForEach(1...3, id: \.self) { i in
                                Button {
                                    switch i {
                                    case 1:
                                        popupText = player.transformation
                                    case 2:
                                        popupText = player.family
                                    default:
                                        popupText = player.trauma
                                    }
                                } label: {
                                    Image("news\(i)")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(height: 80)
                                }
                            }
                        }
                        .padding(.horizontal, 20)
                    }
                    .padding(.bottom, 20)

                    Text("Interesting facts")
                        .font(.arial(size: 16))

                    Text(player.interestingFacts)
                        .font(.arial(size: 14))
                        .lineSpacing(3)
                        .padding(.horizontal, 20)
                        .padding(.bottom, 20)
                    
                    if !isFavorited {
                        Button("Add to Favorites") {
                            favoritePlayers.append(player)
                        }
                        .buttonStyle(.main)
                        .padding(.horizontal, 20)
                    }
                }
                .foregroundStyle(.white)
                .padding(.bottom, 30)
            }
        }
        .background {
            Image(.bg)
                .scaleAspectFill()
                .ignoresSafeArea()
        }
    }
    
    private func statisticsRow(
        year: String,
        goals: String,
        championships: String,
        goldenBall: String,
        matches: String
    ) -> some View {
        HStack {
            Text(String(year))
                .frame(width: 40, alignment: .leading)
            Text("\(goals)")
                .frame(width: 40, alignment: .leading)
            Text(championships)
                .frame(maxWidth: .infinity, alignment: .leading)
            Text(goldenBall)
                .frame(width: 63, alignment: .leading)
            Text("\(matches)")
                .frame(width: 47, alignment: .leading)
        }
        .frame(height: 26)
        .padding(.horizontal, 10)
    }
}

#Preview {
    PlayerDetailView(player: .allPlayers[0])
}
