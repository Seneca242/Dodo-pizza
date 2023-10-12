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
        image: "bigBannerGuessProduct",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "bigBannersOrderDodoCombo",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "bigBannersPeopleMatters",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "bigBannersOpenMoodEnergy",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "bigBannerCodo",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner (
        image: "bigBannersYrReviews",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "newComboBigBanner",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "newPointsBigBanner",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "openMoodBigBanner",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "orderComboBigBanner",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "peopleImportantBigBanner",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "schoolMatesLoveBigBanner",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       ),
       Banner(
        image: "storiesTeamWatchesBigBanner",
        stories: [
            Stories(image: "bigBannerGuessProduct"),
            Stories(image: "bigBannersOrderDodoCombo"),
            Stories(image: "bigBannersPeopleMatters"),
            Stories(image: "bigBannersOpenMoodEnergy"),
            Stories(image: "bigBannerCodo"),
            Stories(image: "bigBannersYrReviews")
        ]
       )
    ]
    
    func fetchBigBanners() -> [Banner] {
        bigBanners
    }
}
