import Foundation

class GameViewModel: ObservableObject {
    @Published var state: GameState = .initial
    @Published var players: [Player] = Player.allPlayers
    @Published var selectedIndex: Int?
    @Published var round = 1
    
    func play() {
        selectedIndex = nil
        round = 1
        players = Player.allPlayers.shuffled()
        state = .playing
    }
    
    func selectPlayer(at index: Int) {
        guard selectedIndex == nil else { return }
        
        selectedIndex = index
        
        if round >= 10 { return }
        
        round += 1
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.0) { [weak self] in
            guard let self = self else { return }
            
            if players.count > 2 {
                let unselectedIndex = index == 0 ? 1 : 0
                
                if players.count > 2 {
                    players[unselectedIndex] = players.remove(at: 2)
                }
            }
            
            if round >= 10 {
                state = .finished
            } else {
                selectedIndex = nil
            }            
        }
    }
}
