import SwiftUI

struct GameView: View {
    @StateObject private var viewModel = GameViewModel()
    @State private var showConfetti = false
    
    var body: some View {
        ZStack {
            switch viewModel.state {
                case .initial:
                initialView
            case .playing:
                playingView
            case .finished:
                finishedView
                
                if showConfetti {
                    Image(.confetti)
                        .resizable()
                        .ignoresSafeArea()
                        .allowsHitTesting(false)
                        .zIndex(1)
                        .transition(.scale.combined(with: .move(edge: .bottom)))
                }
            }
        }
        .foregroundStyle(.white)
        .multilineTextAlignment(.center)
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .padding(.bottom, 100)
        .animation(.default, value: viewModel.state)
    }
    
    private var initialView: some View {
        VStack(spacing: 0) {
            Text("Choose Your\nChampion")
                .font(.ADLaMDisplay(size: 30))
                .textCase(.uppercase)
                .padding(.bottom, 10)
            
            Text("Pick your favorite player\nin a fun game!")
                .font(.ADLaMDisplay(size: 20))
            
            Image(.cup)
                .resizable()
                .scaledToFit()
                .opacity(0.8)
                .offset(y: 30)
                .frame(maxHeight: 300)
            
            Button("Start Game") {
                viewModel.play()
            }
            .buttonStyle(.main)
            .padding(.horizontal, 20)
        }
    }
    
    private var playingView: some View {
        VStack(spacing: 20) {
            Text("Choose Your\nChampion")
                .font(.ADLaMDisplay(size: 30))
                .textCase(.uppercase)
            
            Text("Pick your favorite player\nin a fun game!")
                .font(.ADLaMDisplay(size: 20))
                .padding(.bottom, 20)
            
            HStack(spacing: 20) {
                ForEach(0...1, id: \.self) { index in
                    let player = viewModel.players[index]
                    let isSelected = viewModel.selectedIndex == index
                    
                    VStack(spacing: 10) {
                        Image(player.imageName)
                            .scaleAspectFill()
                            .clipShape(Circle())
                            .frame(width: 100, height: 100)
                            .overlay {
                                Circle().strokeBorder(Color.white.opacity(0.44), lineWidth: 1)
                            }
                            .frame(maxWidth: .infinity)
                            
                        Text(player.name)
                            .font(.ADLaMDisplay(size: 15))
                    }
                    .foregroundStyle(.white)
                    .padding(.vertical, 20)
                    .padding(.horizontal, 10)
                    .background {
                        ZStack {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(LinearGradient(colors: [Color("1234E9"), Color("9F1CFF")], startPoint: .bottomLeading, endPoint: .topTrailing))
                                .opacity(0.58)
                            
                            RoundedRectangle(cornerRadius: 15)
                                .strokeBorder(
                                    Color(isSelected ? "FFFFFF" : "9C36FF"),
                                    lineWidth: isSelected ? 10 : 1
                                )
                        }
                    }
                    .id(player.id)
                    .onTapGesture {
                        viewModel.selectPlayer(at: index)
                    }
                    .transition(.scale)
                    .animation(.default, value: player)
                }
            }
            .padding(.horizontal, 20)
            .animation(.default, value: viewModel.selectedIndex)
        }
    }
    
    private var finishedView: some View {
        VStack(spacing: 30) {
            Text("our\nChampion!")
                .font(.ADLaMDisplay(size: 30))
                .textCase(.uppercase)
         
            let champ = viewModel.players[viewModel.selectedIndex ?? 0]
            ZStack {
                RoundedRectangle(cornerRadius: 15)
                    .fill(LinearGradient(colors: [Color("1234E9"), Color("9F1CFF")], startPoint: .bottomLeading, endPoint: .topTrailing))
                    .opacity(0.58)
                
                RoundedRectangle(cornerRadius: 15)
                    .strokeBorder(Color("9C36FF"), lineWidth: 1)
                
                VStack(spacing: 10) {
                    Image(champ.imageName)
                        .scaleAspectFill()
                        .clipShape(Circle())
                        .frame(width: 170, height: 170)
                        .overlay {
                            Circle().strokeBorder(Color.white.opacity(0.44), lineWidth: 1)
                        }
                        .frame(maxWidth: .infinity)
                    
                    Text(champ.name)
                        .font(.ADLaMDisplay(size: 15))
                        .foregroundStyle(.white)
                }
            }
            .aspectRatio(1, contentMode: .fit)
            .padding(.horizontal, 24)
            .background(alignment: .bottomLeading) {
                Image(.cup)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.8)
                
                .frame(height: 100)
                .offset(y: 30)
            }
            .background(alignment: .bottomTrailing) {
                Image(.cup)
                    .resizable()
                    .scaledToFit()
                    .opacity(0.8)
                
                .frame(height: 100)
                .offset(y: 30)
            }
            
            Button("Play Again") {
                viewModel.state = .initial
            }
            .buttonStyle(.main)
            .padding(.horizontal, 20)
        }
        .onAppear {
            withAnimation(.easeInOut(duration: 0.5)) {
                showConfetti = true
            }
        }
        .onDisappear {
            withAnimation(.linear(duration: 0)) {
                showConfetti = false
            }
        }
    }
}

#Preview {
    GameView()
}
