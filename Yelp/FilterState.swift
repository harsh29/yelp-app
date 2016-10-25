//
//  FilterState.swift
//  Yelp
//
//  Created by Harsh Trivedi on 10/24/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import UIKit

class FilterState {

    var searchString = "";
    var filters = Filters();
    
    func getData(offset: Int?, view: UIView, completion: @escaping ([Business]?, Error?) -> Void)
    {
        _ = YelpClient.sharedInstance.searchWithTerm(
            searchString,
            sort: filters.sort,
            categories: filters.categories,
            deals: filters.offeringDeal,
            completion: completion)
    }
}
