//
//  BusinessesViewController.swift
//  Yelp
//
//  Created by Timothy Lee on 4/23/15.
//  Copyright (c) 2015 Timothy Lee. All rights reserved.
//

import UIKit

class BusinessesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    var businesses: [Business]!
    var searchBar: UISearchBar!
    var filterState = FilterState();
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // change the navigation bar color to red
        navigationController!.navigationBar.barTintColor = UIColor(red: CGFloat(202.0 / 255.0), green: CGFloat(20.0/255.0), blue: CGFloat(6.0/255.0), alpha: 1.0);
        
        //search bar in the navigation bar
        searchBar = UISearchBar();
        searchBar.delegate = self;
        searchBar.enablesReturnKeyAutomatically = false
        searchBar.sizeToFit()
        navigationItem.titleView = searchBar
        
        tableView.dataSource = self;
        tableView.delegate = self;
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 120 //not sure about this. but lets set it to 120
        
        performSearch();
        /* Example of Yelp search with more search options specified
         Business.searchWithTerm("Restaurants", sort: .Distance, categories: ["asianfusion", "burgers"], deals: true) { (businesses: [Business]!, error: NSError!) -> Void in
         self.businesses = businesses
         
         for business in businesses {
         print(business.name!)
         print(business.address!)
         }
         }
         */
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if businesses != nil{
            return businesses.count;
        } else{
            return 0;
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell = tableView.dequeueReusableCell(withIdentifier: "BusinessCell", for: indexPath) as! BusinessCell
        
        cell.business = businesses[indexPath.row];
        
        return cell;
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
     // MARK: - Navigation
     
     // In a storyboard-based application, you will often want to do a little preparation before navigation
     */
    override func prepare(for segue: UIStoryboardSegue, sender: Any?)
    {
        // Set self as the filtersViewController delegate.
        let navigationController = segue.destination as! UINavigationController
        let filtersViewController = navigationController.topViewController as! FiltersViewController
        filtersViewController.delegate = self
        filtersViewController.filters = filterState.filters
    }
    
    
    func performSearch(offset: Int? = nil)
    {
        filterState.getData(
            offset: offset,
            view: view,
            completion: { (businesses: [Business]?, error: Error?) -> Void in
                if offset != nil
                {
                    self.businesses?.append(contentsOf: businesses!)
                }
                else
                {
                    self.businesses = businesses
                    
                    self.tableView.scrollRectToVisible(CGRect(x: 0, y: 0, width: 1, height: 1), animated: false)
                }
                
                self.tableView.reloadData()
        })
        
    }
    
}

extension BusinessesViewController: UISearchBarDelegate
{
    func searchBarTextDidBeginEditing(_ searchBar: UISearchBar)
    {
        searchBar.showsCancelButton = true
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar)
    {
        filterState.searchString = searchBar.text!
        performSearch()
        searchBar.resignFirstResponder()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar)
    {
        searchBar.showsCancelButton = false
        searchBar.text = filterState.searchString
        searchBar.resignFirstResponder()
    }
}

extension BusinessesViewController: FiltersViewControllerDelegate
{
    func filtersViewController(filtersViewController: FiltersViewController, didUpdateFilters filters: Filters)
    {
        filterState.filters = filters
        performSearch()
    }
}


