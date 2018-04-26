//
//  MainCollectionViewController.swift
//  foodApp
//
//  Created by Mateusz Matejczyk on 26.04.2018.
//  Copyright © 2018 Matejczyk. All rights reserved.
//

import UIKit
import CoreData

private let reuseIdentifier = "Cell"

class MainCollectionViewController: UICollectionViewController {
    
        var cuisineData = [Cuisine]()
    


    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Register cell classes
        self.collectionView!.register(UICollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)

        addDefaultData()
        
        for c in  cuisineData
        {
            print("name: \(c.name ?? "none"), country: \(c.country ?? "none")")
            
            for d in c.food?.allObjects as! [Dish]
            {
                print("name: \(d.name ?? "none"), cost: \(d.cost)$")
            }
        }
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 0
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath)
    
        // Configure the cell
    
        return cell
    }

    // MARK: UICollectionViewDelegate

    /*
    // Uncomment this method to specify if the specified item should be highlighted during tracking
    override func collectionView(_ collectionView: UICollectionView, shouldHighlightItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment this method to specify if the specified item should be selected
    override func collectionView(_ collectionView: UICollectionView, shouldSelectItemAt indexPath: IndexPath) -> Bool {
        return true
    }
    */

    /*
    // Uncomment these methods to specify if an action menu should be displayed for the specified item, and react to actions performed on the item
    override func collectionView(_ collectionView: UICollectionView, shouldShowMenuForItemAt indexPath: IndexPath) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, canPerformAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) -> Bool {
        return false
    }

    override func collectionView(_ collectionView: UICollectionView, performAction action: Selector, forItemAt indexPath: IndexPath, withSender sender: Any?) {
    
    }
    */
    
    func loadData()
    {
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        let request = NSFetchRequest<NSFetchRequestResult>(entityName: "Cuisine")
        print("test load")
        do
        {
            try self.cuisineData = context.fetch(request) as! [Cuisine]
        }
        catch let error as NSError
        {
            print("\(error.localizedFailureReason ?? "dupa nie error")")
        }
    }
    
    func addDefaultData()
    {
        loadData()
        
        let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

        if (cuisineData.count == 0)
        {
            print("dopsywanie do bazy")
            let entity = NSEntityDescription.entity(forEntityName: "Cuisine", in: context)
            
            let cuisine = Cuisine(entity: entity!, insertInto: context)
            cuisine.name = "Mexican cuisine"
            cuisine.country = "Mexico"
            let imageData: Data = UIImageJPEGRepresentation(#imageLiteral(resourceName: "meksLogo.png"), 0.5)! as Data
            cuisine.image = imageData
            
            let dish1 = Dish(context: context)
            dish1.name = "meks1"
            dish1.depiction = ""
            dish1.image = UIImageJPEGRepresentation(#imageLiteral(resourceName: "meks1.jpg"), 0.5)
            dish1.cost = 10.5
            
            let dish2 = Dish(context: context)
            dish2.name = "meks2"
            dish2.depiction = ""
            dish2.image = UIImageJPEGRepresentation(#imageLiteral(resourceName: "meks2.jpg"), 0.5)
            dish2.cost = 12.8
            
            let dish3 = Dish(context: context)
            dish3.name = "meks3"
            dish3.depiction = ""
            dish3.image = UIImageJPEGRepresentation(#imageLiteral(resourceName: "meks3.jpg"), 0.5)
            dish3.cost = 5.99
            
            let dish4 = Dish(context: context)
            dish4.name = "meks4"
            dish4.depiction = ""
            dish4.image = UIImageJPEGRepresentation(#imageLiteral(resourceName: "meks4.jpg"), 0.5)
            dish4.cost = 24.5
            
            let dish5 = Dish(context: context)
            dish5.name = "meks5"
            dish5.depiction = ""
            dish5.image = UIImageJPEGRepresentation(#imageLiteral(resourceName: "meks5.jpg"), 0.5)
            dish5.cost = 12.45
            
            let dish6 = Dish(context: context)
            dish6.name = "meks6"
            dish6.depiction = ""
            dish6.image = UIImageJPEGRepresentation(#imageLiteral(resourceName: "meks6.jpg"), 0.5)
            dish6.cost = 9.99
            
            cuisine.addToFood(dish1)
            cuisine.addToFood(dish2)
            cuisine.addToFood(dish3)
            cuisine.addToFood(dish4)
            cuisine.addToFood(dish5)
            cuisine.addToFood(dish6)
            
            
            do
            {
                try context.save()
                
            
            }
            catch let error as NSError
            {
                print("\(error.localizedFailureReason ?? "dupa a nie error")")
            }
            
            loadData()
        }
    }

}
