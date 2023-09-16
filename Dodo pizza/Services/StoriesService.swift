//
//  StoriesService.swift
//  Dodo pizza
//
//  Created by Dmitry Dmitry on 15.09.2023.
//

import Foundation

class StoriesService {
    private let stories: [Stories] = [
       Stories (
        image: "storiesTeamWatches1"
       ),
       Stories (
        image: "storiesTeamWatches2"
       ),
       Stories (
        image: "storiesTeamWatches3"
       ),
       Stories (
        image: "storiesTeamWatches4"
       ),
       Stories (
        image: "storiesTeamWatches5"
       )
    ]
    
    func fetchBanners() -> [Stories] {
        stories
    }
}
