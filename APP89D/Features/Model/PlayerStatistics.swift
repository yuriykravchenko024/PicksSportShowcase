import Foundation

struct PlayerStatistics: Identifiable {
    let year: Int
    let goals: Int
    let championships: Int
    let goldenBall: Bool
    let matches: Int
}

extension PlayerStatistics {
    var id: Int { year }
}
enum PlayerStatisticsFactory {
    static func statisticsForPlayer(id: Int) -> [PlayerStatistics] {
        switch id {
        case 1: // Kylian Mbappé
            return [
                PlayerStatistics(year: 2018, goals: 4, championships: 2, goldenBall: false, matches: 44), // World Cup, Ligue 1
                PlayerStatistics(year: 2022, goals: 8, championships: 1, goldenBall: false, matches: 56), // Ligue 1
                PlayerStatistics(year: 2024, goals: 8, championships: 0, goldenBall: false, matches: 40)  // None
            ]
        case 2: // Lionel Messi
            return [
                PlayerStatistics(year: 2012, goals: 91, championships: 0, goldenBall: true, matches: 69), // None
                PlayerStatistics(year: 2021, goals: 43, championships: 2, goldenBall: true, matches: 61), // Copa América, Ligue 1
                PlayerStatistics(year: 2022, goals: 18, championships: 1, goldenBall: true, matches: 53)  // World Cup
            ]
        case 3: // Cristiano Ronaldo
            return [
                PlayerStatistics(year: 2013, goals: 69, championships: 0, goldenBall: true, matches: 59), // None
                PlayerStatistics(year: 2016, goals: 51, championships: 2, goldenBall: true, matches: 62), // Champions League, Euro 2016
                PlayerStatistics(year: 2023, goals: 54, championships: 1, goldenBall: false, matches: 59) // Arab Club Champions Cup
            ]
        case 4: // Diego Maradona
            return [
                PlayerStatistics(year: 1986, goals: 10, championships: 1, goldenBall: false, matches: 45), // World Cup
                PlayerStatistics(year: 1987, goals: 17, championships: 1, goldenBall: false, matches: 50), // Serie A
                PlayerStatistics(year: 1990, goals: 16, championships: 0, goldenBall: false, matches: 48)  // None
            ]
        case 5: // Johan Cruyff
            return [
                PlayerStatistics(year: 1971, goals: 27, championships: 1, goldenBall: true, matches: 48), // European Cup
                PlayerStatistics(year: 1974, goals: 15, championships: 0, goldenBall: true, matches: 50), // None
                PlayerStatistics(year: 1992, goals: 0, championships: 1, goldenBall: false, matches: 0)   // European Cup (as coach)
            ]
        case 6: // Franz Beckenbauer
            return [
                PlayerStatistics(year: 1972, goals: 5, championships: 1, goldenBall: true, matches: 55),  // Euros
                PlayerStatistics(year: 1974, goals: 4, championships: 2, goldenBall: false, matches: 60), // World Cup, European Cup
                PlayerStatistics(year: 1990, goals: 0, championships: 1, goldenBall: false, matches: 0)   // World Cup (as coach)
            ]
        case 7: // Zinedine Zidane
            return [
                PlayerStatistics(year: 1998, goals: 12, championships: 1, goldenBall: true, matches: 52), // World Cup
                PlayerStatistics(year: 2002, goals: 12, championships: 1, goldenBall: false, matches: 49), // Champions League
                PlayerStatistics(year: 2006, goals: 7, championships: 0, goldenBall: false, matches: 44)  // None
            ]
        case 8: // Gianluigi Buffon
            return [
                PlayerStatistics(year: 2006, goals: 0, championships: 1, goldenBall: false, matches: 54), // World Cup
                PlayerStatistics(year: 2012, goals: 0, championships: 0, goldenBall: false, matches: 52), // None
                PlayerStatistics(year: 2017, goals: 0, championships: 1, goldenBall: false, matches: 45)  // Serie A
            ]
        default:
            return []
        }
    }
}
