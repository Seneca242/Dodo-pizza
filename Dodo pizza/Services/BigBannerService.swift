//
//  BigBannerService.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 14.09.2023.
//

import Foundation

class BigBannerService {
    private let bigBanners: [Banner] = [
       Banner (
        image: "firstOrderBigBanner"
       ),
       Banner(
        image: "gifts4WaitingBigBanner"
       ),
       Banner(
        image: "hotGentleBigBanner"
       ),
       Banner(
        image: "kolbasaHeroBigBanner"
       ),
       Banner(
        image: "monthWordBigBanner"
       ),
       Banner (
        image: "mortadellaBigBanner"
       ),
       Banner(
        image: "newComboBigBanner"
       ),
       Banner(
        image: "newPointsBigBanner"
       ),
       Banner(
        image: "openMoodBigBanner"
       ),
       Banner(
        image: "orderComboBigBanner"
       ),
       Banner(
        image: "peopleImportantBigBanner"
       ),
       Banner(
        image: "schoolMatesLoveBigBanner"
       ),
       Banner(
        image: "storiesTeamWatchesBigBanner"
       )
    ]
    
    func fetchBanners() -> [Banner] {
        bigBanners
    }
}
