//
//  Filters.swift
//  Yelp
//
//  Created by Harsh Trivedi on 10/24/16.
//  Copyright © 2016 Timothy Lee. All rights reserved.
//

import Foundation

protocol ComboBoxEnum
{
    var description: String { get }
    
    static var count: Int { get }
}

struct Filters{

    var offeringDeal = false;
    var sort = YelpSortMode.bestMatched;
    var categories : [String]?
    
    mutating func addCategory(category: String){
        if categories != nil{
            categories?.append(category);
        }else{
            categories = [String]();
            categories?.append(category);
        }
    }
    
    mutating func removeCategory(category: String){
        if categories != nil{
            if let elementIndex = categories!.index(of: category){
                categories!.remove(at: elementIndex);
            }
        }
    }
    
    mutating func isCategoryDefined(category: String) ->Bool{
        if(categories != nil && categories?.index(of: category) != nil){
            return true;
        }else{
            return false;
        }
    }
}
