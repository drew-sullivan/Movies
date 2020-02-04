//
//  MovieStoreTests.swift
//  MoviesTests
//
//  Created by Drew Sullivan on 2/3/20.
//  Copyright © 2020 Allegion, LLC. All rights reserved.
//

import XCTest
@testable import Movies

class MovieStoreTests: XCTestCase {

    var sut: MovieStore!
    var mockURLSession: MockURLSession!

    override func setUp() {
        super.setUp()

        sut = MovieStore()
    }

    override func tearDown() {
        mockURLSession = nil
        sut = nil

        super.tearDown()
    }

    func test_fetchingMovieMetadata_createsMovieObjects() {
        let mockJSONData = "{\"page\":1,\"total_results\":2115,\"total_pages\":106,\"results\":[{\"popularity\":244.143,\"vote_count\":1871,\"video\":false,\"poster_path\":\"\\/iZf0KyrE25z1sage4SYFLCCrMi9.jpg\",\"id\":530915,\"adult\":false,\"backdrop_path\":\"\\/2WgieNR1tGHlpJUsolbVzbUbE1O.jpg\",\"original_language\":\"en\",\"original_title\":\"1917\",\"genre_ids\":[18,36,10752],\"title\":\"1917\",\"vote_average\":8.1,\"overview\":\"At the height of the First World War, two young British soldiers, Schofield and Blake are given a seemingly impossible mission. In a race against time, they must cross enemy territory and deliver a message that will stop a deadly attack on hundreds of soldiers—Blake's own brother among them.\",\"release_date\":\"2019-12-10\"},{\"popularity\":195.04,\"vote_count\":550,\"video\":false,\"poster_path\":\"\\/y95lQLnuNKdPAzw9F9Ab8kJ80c3.jpg\",\"id\":38700,\"adult\":false,\"backdrop_path\":\"\\/upUy2QhMZEmtypPW3PdieKLAHxh.jpg\",\"original_language\":\"en\",\"original_title\":\"Bad Boys for Life\",\"genre_ids\":[28,80,53],\"title\":\"Bad Boys for Life\",\"vote_average\":6.5,\"overview\":\"Marcus and Mike are forced to confront new threats, career changes, and midlife crises as they join the newly created elite team AMMO of the Miami police department to take down the ruthless Armando Armas, the vicious leader of a Miami drug cartel.\",\"release_date\":\"2020-01-17\"},{\"popularity\":190.569,\"vote_count\":1196,\"video\":false,\"poster_path\":\"\\/6ApDtO7xaWAfPqfi2IARXIzj8QS.jpg\",\"id\":359724,\"adult\":false,\"backdrop_path\":\"\\/n3UanIvmnBlH531pykuzNs4LbH6.jpg\",\"original_language\":\"en\",\"original_title\":\"Ford v Ferrari\",\"genre_ids\":[28,18],\"title\":\"Ford v Ferrari\",\"vote_average\":7.8,\"overview\":\"American car designer Carroll Shelby and the British-born driver Ken Miles work together to battle corporate interference, the laws of physics, and their own personal demons to build a revolutionary race car for Ford Motor Company and take on the dominating race cars of Enzo Ferrari at the 24 Hours of Le Mans in France in 1966.\",\"release_date\":\"2019-11-15\"},{\"popularity\":150.262,\"vote_count\":8636,\"video\":false,\"poster_path\":\"\\/udDclJoHjfjb8Ekgsd4FDteOkCU.jpg\",\"id\":475557,\"adult\":false,\"backdrop_path\":\"\\/n6bUvigpRFqSwmPp1m2YADdbRBc.jpg\",\"original_language\":\"en\",\"original_title\":\"Joker\",\"genre_ids\":[80,18,53],\"title\":\"Joker\",\"vote_average\":8.3,\"overview\":\"During the 1980s, a failed stand-up comedian is driven insane and turns to a life of crime and chaos in Gotham City while becoming an infamous psychopathic crime figure.\",\"release_date\":\"2019-10-04\"},{\"popularity\":119.475,\"vote_count\":1277,\"video\":false,\"poster_path\":\"\\/vqzNJRH4YyquRiWxCCOH0aXggHI.jpg\",\"id\":290859,\"adult\":false,\"backdrop_path\":\"\\/riTANvQ8GKmQbgtC1ps3OfkU43A.jpg\",\"original_language\":\"en\",\"original_title\":\"Terminator: Dark Fate\",\"genre_ids\":[28,878],\"title\":\"Terminator: Dark Fate\",\"vote_average\":6.2,\"overview\":\"Decades after Sarah Connor prevented Judgment Day, a lethal new Terminator is sent to eliminate the future leader of the resistance. In a fight to save mankind, battle-hardened Sarah Connor teams up with an unexpected ally and an enhanced super soldier to stop the deadliest Terminator yet.\",\"release_date\":\"2019-11-01\"},{\"popularity\":114.461,\"vote_count\":226,\"video\":false,\"poster_path\":\"\\/yJdeWaVXa2se9agI6B4mQunVYkB.jpg\",\"id\":449924,\"adult\":false,\"backdrop_path\":\"\\/ekP6EVxL81lZ4ivcqPsoZ72rY0h.jpg\",\"original_language\":\"cn\",\"original_title\":\"葉問4\",\"genre_ids\":[28,18,36],\"title\":\"Ip Man 4: The Finale\",\"vote_average\":6,\"overview\":\"Following the death of his wife, Ip Man travels to San Francisco to ease tensions between the local kung fu masters and his star student, Bruce Lee, while searching for a better future for his son.\",\"release_date\":\"2019-12-25\"},{\"popularity\":85.235,\"vote_count\":898,\"video\":false,\"poster_path\":\"\\/p69QzIBbN06aTYqRRiCOY1emNBh.jpg\",\"id\":501170,\"adult\":false,\"backdrop_path\":\"\\/1nm0sk8UUx9jHCTHuMKe2jkt4Pn.jpg\",\"original_language\":\"en\",\"original_title\":\"Doctor Sleep\",\"genre_ids\":[18,14,27],\"title\":\"Doctor Sleep\",\"vote_average\":7.1,\"overview\":\"Still irrevocably scarred by the trauma he endured as a child at the Overlook, Dan Torrance has fought to find some semblance of peace. But that peace is shattered when he encounters Abra, a courageous teenager with her own powerful extrasensory gift, known as the 'shine'. Instinctively recognising that Dan shares her power, Abra has sought him out, desperate for his help against the merciless Rose the Hat and her followers.\",\"release_date\":\"2019-11-08\"},{\"popularity\":112.77,\"vote_count\":16,\"video\":false,\"poster_path\":\"\\/z7FCF54Jvzv9Anxyf82QeqFXXOO.jpg\",\"id\":495764,\"adult\":false,\"backdrop_path\":\"\\/jiqD14fg7UTZOT6qgvzTmfRYpWI.jpg\",\"original_language\":\"en\",\"original_title\":\"Birds of Prey (and the Fantabulous Emancipation of One Harley Quinn)\",\"genre_ids\":[28,12,80],\"title\":\"Birds of Prey (and the Fantabulous Emancipation of One Harley Quinn)\",\"vote_average\":8.3,\"overview\":\"After splitting with the Joker, Harley Quinn joins superheroes Black Canary, Huntress and Renee Montoya to save a young girl from an evil crime lord.\",\"release_date\":\"2020-02-07\"},{\"popularity\":85.619,\"vote_count\":2795,\"video\":false,\"poster_path\":\"\\/db32LaOibwEliAmSL2jjDF6oDdj.jpg\",\"id\":181812,\"adult\":false,\"backdrop_path\":\"\\/jOzrELAzFxtMx2I4uDGHOotdfsS.jpg\",\"original_language\":\"en\",\"original_title\":\"Star Wars: The Rise of Skywalker\",\"genre_ids\":[28,12,878],\"title\":\"Star Wars: The Rise of Skywalker\",\"vote_average\":6.5,\"overview\":\"The surviving Resistance faces the First Order once again as the journey of Rey, Finn and Poe Dameron continues. With the power and knowledge of generations behind them, the final battle begins.\",\"release_date\":\"2019-12-20\"},{\"popularity\":90.64,\"vote_count\":1172,\"video\":false,\"poster_path\":\"\\/7GsM4mtM0worCtIVeiQt28HieeN.jpg\",\"id\":515001,\"adult\":false,\"backdrop_path\":\"\\/agoBZfL1q5G79SD0npArSlJn8BH.jpg\",\"original_language\":\"en\",\"original_title\":\"Jojo Rabbit\",\"genre_ids\":[35,18,10752],\"title\":\"Jojo Rabbit\",\"vote_average\":8.2,\"overview\":\"A World War II satire that follows a lonely German boy whose world view is turned upside down when he discovers his single mother is hiding a young Jewish girl in their attic. Aided only by his idiotic imaginary friend, Adolf Hitler, Jojo must confront his blind nationalism.\",\"release_date\":\"2019-10-18\"},{\"popularity\":90.552,\"vote_count\":1301,\"video\":false,\"poster_path\":\"\\/uTALxjQU8e1lhmNjP9nnJ3t2pRU.jpg\",\"id\":453405,\"adult\":false,\"backdrop_path\":\"\\/sfW7GcOuwZFuCxVoU5ULlkiDJ7Q.jpg\",\"original_language\":\"en\",\"original_title\":\"Gemini Man\",\"genre_ids\":[28,53],\"title\":\"Gemini Man\",\"vote_average\":5.8,\"overview\":\"Ageing assassin, Henry Brogen tries to get out of the business but finds himself in the ultimate battle—fighting his own clone who is 25 years younger than him, and at the peak of his abilities.\",\"release_date\":\"2019-10-11\"},{\"popularity\":67.615,\"vote_count\":69,\"video\":false,\"poster_path\":\"\\/lRZ1U7LeRbW7swneo4BOqNCeKXy.jpg\",\"id\":653567,\"adult\":false,\"backdrop_path\":\"\\/A7AjlQTR1UlaNSYwwPRQ5gQTHyf.jpg\",\"original_language\":\"en\",\"original_title\":\"Miss Americana\",\"genre_ids\":[99],\"title\":\"Miss Americana\",\"vote_average\":8,\"overview\":\"A raw and emotionally revealing look at one of the most iconic artists of our time during a transformational period in her life as she learns to embrace her role not only as a songwriter and performer, but as a woman harnessing the full power of her voice.\",\"release_date\":\"2020-01-31\"},{\"popularity\":71.146,\"vote_count\":2091,\"video\":false,\"poster_path\":\"\\/pjeMs3yqRmFL3giJy4PMXWZTTPa.jpg\",\"id\":330457,\"adult\":false,\"backdrop_path\":\"\\/xJWPZIYOEFIjZpBL7SVBGnzRYXp.jpg\",\"original_language\":\"en\",\"original_title\":\"Frozen II\",\"genre_ids\":[12,16,10402,10751],\"title\":\"Frozen II\",\"vote_average\":7,\"overview\":\"Elsa, Anna, Kristoff and Olaf head far into the forest to learn the truth about an ancient mystery of their kingdom.\",\"release_date\":\"2019-11-22\"},{\"popularity\":75.149,\"vote_count\":1686,\"video\":false,\"poster_path\":\"\\/vloNTScJ3w7jwNwtNGoG8DbTThv.jpg\",\"id\":420809,\"adult\":false,\"backdrop_path\":\"\\/skvI4rYFrKXS73BJxWGH54Omlvv.jpg\",\"original_language\":\"en\",\"original_title\":\"Maleficent: Mistress of Evil\",\"genre_ids\":[12,14,10751],\"title\":\"Maleficent: Mistress of Evil\",\"vote_average\":7.2,\"overview\":\"Maleficent and her goddaughter Aurora begin to question the complex family ties that bind them as they are pulled in different directions by impending nuptials, unexpected allies, and dark new forces at play.\",\"release_date\":\"2019-10-18\"},{\"popularity\":71.62,\"vote_count\":1382,\"video\":false,\"poster_path\":\"\\/jyw8VKYEiM1UDzPB7NsisUgBeJ8.jpg\",\"id\":512200,\"adult\":false,\"backdrop_path\":\"\\/zTxHf9iIOCqRbxvl8W5QYKrsMLq.jpg\",\"original_language\":\"en\",\"original_title\":\"Jumanji: The Next Level\",\"genre_ids\":[28,12,35,14],\"title\":\"Jumanji: The Next Level\",\"vote_average\":6.7,\"overview\":\"As the gang return to Jumanji to rescue one of their own, they discover that nothing is as they expect. The players will have to brave parts unknown and unexplored in order to escape the world’s most dangerous game.\",\"release_date\":\"2019-12-13\"},{\"popularity\":68.733,\"vote_count\":893,\"video\":false,\"poster_path\":\"\\/wE5aZnk43mWV3BKh7Cv3vODTXro.jpg\",\"id\":331482,\"adult\":false,\"backdrop_path\":\"\\/3uTxPIdVEXxHpsHOHdJC24QebBV.jpg\",\"original_language\":\"en\",\"original_title\":\"Little Women\",\"genre_ids\":[18,10749],\"title\":\"Little Women\",\"vote_average\":8,\"overview\":\"Four sisters come of age in America in the aftermath of the Civil War.\",\"release_date\":\"2019-12-25\"},{\"popularity\":66.133,\"vote_count\":160,\"video\":false,\"poster_path\":\"\\/xxLdm3J8WiPLePIEa1ZfmLcMETT.jpg\",\"id\":448119,\"adult\":false,\"backdrop_path\":\"\\/lG802rseTZcN9mtLsQPVfApEVzM.jpg\",\"original_language\":\"en\",\"original_title\":\"Dolittle\",\"genre_ids\":[28,12,35,14,10751],\"title\":\"Dolittle\",\"vote_average\":6.4,\"overview\":\"After losing his wife seven years earlier, the eccentric Dr. John Dolittle, famed doctor and veterinarian of Queen Victoria’s England, hermits himself away behind the high walls of Dolittle Manor with only his menagerie of exotic animals for company. But when the young queen falls gravely ill, a reluctant Dolittle is forced to set sail on an epic adventure to a mythical island in search of a cure, regaining his wit and courage as he crosses old adversaries and discovers wondrous creatures.\",\"release_date\":\"2020-01-17\"},{\"popularity\":96.289,\"vote_count\":496,\"video\":false,\"poster_path\":\"\\/7gOozJufKJ9WjcIs38KEs08Iq3D.jpg\",\"id\":473033,\"adult\":false,\"backdrop_path\":\"\\/uzvT6tYrU5SxfHe1ieimIGAqyFm.jpg\",\"original_language\":\"en\",\"original_title\":\"Uncut Gems\",\"genre_ids\":[80,18,53],\"title\":\"Uncut Gems\",\"vote_average\":7.5,\"overview\":\"A charismatic New York City jeweler always on the lookout for the next big score makes a series of high-stakes bets that could lead to the windfall of a lifetime. Howard must perform a precarious high-wire act, balancing business, family, and encroaching adversaries on all sides in his relentless pursuit of the ultimate win.\",\"release_date\":\"2019-12-13\"},{\"popularity\":47.562,\"vote_count\":453,\"video\":false,\"poster_path\":\"\\/kDEjffiKgjuGo2DRzsqfjvW0CQh.jpg\",\"id\":549053,\"adult\":false,\"backdrop_path\":\"\\/eZ9wYTk9Gy2zYEv8rhRG3IoPuXG.jpg\",\"original_language\":\"en\",\"original_title\":\"Last Christmas\",\"genre_ids\":[35,18,10749],\"title\":\"Last Christmas\",\"vote_average\":7,\"overview\":\"Kate is a young woman has a habit of making bad decisions, and her last date with disaster occurs after she accepts work as Santa's elf for a department store. However, after she meets Tom there, her life takes a new turn.\",\"release_date\":\"2019-11-08\"},{\"popularity\":54.595,\"vote_count\":258,\"video\":false,\"poster_path\":\"\\/qCDPKUMX5xrxxQY8XhGVCKO3fks.jpg\",\"id\":599975,\"adult\":false,\"backdrop_path\":\"\\/zETkzgle7c6wAeW11snnVUBp67S.jpg\",\"original_language\":\"en\",\"original_title\":\"Countdown\",\"genre_ids\":[27,53],\"title\":\"Countdown\",\"vote_average\":6.3,\"overview\":\"A young nurse downloads an app that tells her she only has three days to live. With time ticking away and a mysterious figure haunting her, she must find a way to save her life before time runs out.\",\"release_date\":\"2019-10-25\"}]}".data(using: .utf8)
        mockURLSession = MockURLSession(data: mockJSONData, urlResponse: nil, error: nil)
        sut.session = mockURLSession

        let moviesExpectation = expectation(description: "Movies")
        var caughtMovies: [Movie]? = nil
        sut.fetchMovieMetadata(byMovieListType: .nowPlaying) { (movieResult) in
            switch movieResult {
                case .success(let movies):
                    caughtMovies = movies
                    moviesExpectation.fulfill()
                case .failure(let error): XCTFail(error.localizedDescription)
            }
        }
        waitForExpectations(timeout: 1) { _ in
            XCTAssertEqual(caughtMovies?.count, 20)
        }
    }

}

extension MovieStoreTests {

    class MockURLSession: SessionProtocol {
        var url: URL?
        private let dataTask: MockTask

        var urlComponents: URLComponents? {
            guard let url = url else { return nil }
            return URLComponents(url: url, resolvingAgainstBaseURL: false)
        }

        init(data: Data?, urlResponse: URLResponse?, error: Error?) {
            dataTask = MockTask(data: data, urlResponse: urlResponse, error: error)
        }

        func dataTask(with url: URL, completionHandler: @escaping (Data?, URLResponse?, Error?) -> Void) -> URLSessionDataTask {
            self.url = url
            dataTask.completionHandler = completionHandler
            return dataTask
        }
    }

    class MockTask: URLSessionDataTask {
        private let data: Data?
        private let urlResponse: URLResponse?
        private let responseError: Error?

        typealias DataTaskCompletionHandler = (Data?, URLResponse?, Error?) -> Void
        var completionHandler: DataTaskCompletionHandler?

        init(data: Data?, urlResponse: URLResponse?, error: Error?) {
            self.data = data
            self.urlResponse = urlResponse
            self.responseError = error
        }

        override func resume() {
            DispatchQueue.main.async {
                self.completionHandler?(self.data, self.urlResponse, self.responseError)
            }
        }
    }

}

extension String {

    func stringify(json: Any, prettyPrinted: Bool = false) -> String {
        var options: JSONSerialization.WritingOptions = []

        if prettyPrinted {
            options = JSONSerialization.WritingOptions.prettyPrinted
        }

        do {
            let data = try JSONSerialization.data(withJSONObject: json, options: options)
            if let string = String(data: data, encoding: String.Encoding.utf8) {
                return string
            }
        } catch {
            print(error)
        }
        return ""
    }

}
