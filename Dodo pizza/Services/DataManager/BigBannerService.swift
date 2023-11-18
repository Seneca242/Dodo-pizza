//
//  BigBannerService.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 14.09.2023.
//

import Foundation

class BigBannerService {
    private let bigBanners: [BigBanner] = [
       BigBanner (
        image: "dontWaitTheOrderBigBanner",
        stories: [
            Stories(image: "dontWaitPage1"),
            Stories(image: "dontWaitPage2"),
            Stories(image: "dontWaitPage3")
        ]
       ),
       BigBanner(
        image: "15OfTheMonthBigBanner",
        stories: [
            Stories(image: "15MonthPage1")
        ]
       ),
       BigBanner(
        image: "theFallBigBanner",
        stories: [
            Stories(image: "theFallPage1"),
            Stories(image: "theFallPage2")
        ]
       ),
       BigBanner(
        image: "250DevelopersBigBanner",
        stories: [
            Stories(image: "250Page1"),
            Stories(image: "250Page2")
        ]
       ),
       BigBanner(
        image: "redMoodBigBanner",
        stories: [
            Stories(image: "redMoodPage1")
        ]
       ),
       BigBanner(
        image: "catMoodBigBanner",
        stories: [
            Stories(image: "catMoodPage1"),
            Stories(image: "catMoodPage2")
        ]
       ),
       BigBanner (
        image: "eveningAtHomeBigBanner",
        stories: [
            Stories(image: "eveningPage1"),
            Stories(image: "eveningPage2"),
            Stories(image: "eveningPage3"),
            Stories(image: "eveningPage4"),
            Stories(image: "eveningPage5"),
            Stories(image: "eveningPage6"),
            Stories(image: "eveningPage7"),
            Stories(image: "eveningPage8")
        ]
       ),
       BigBanner(
        image: "hotAndGentleBigBanner",
        stories: [
            Stories(image: "hotGentlePage1"),
            Stories(image: "hotGentlePage2")
        ]
       )
    ]
    
    func fetchBigBanners() -> [BigBanner] {
        bigBanners
    }
}
