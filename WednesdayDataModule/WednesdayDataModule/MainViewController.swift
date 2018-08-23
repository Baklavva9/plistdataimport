//
//  MainViewController.swift
//  WednesdayDataModule
//
//  Created by Xcode Server on 22/8/18.
//  Copyright © 2018 Xcode Server. All rights reserved.
//

import UIKit
import CoreData

class MainViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, NSFetchedResultsControllerDelegate {

    
    @IBOutlet var datatableView: UITableView!
    
    var user = [UserPL]()
//    private var fetchResultController: NSFetchedResultsController<NSFetchRequestResult>?
    let managedContext = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    
 //   var user: User!
    
 
    var fetchResultController: NSFetchedResultsController<UserPL>!
    
    
    private var managedObjectContext: NSManagedObjectContext?
    
    var nameValueArray: NSArray!
    var emailValueArray: NSArray!
    
 
    
    var nameValue : String = ""
    var emailValue : String = ""

    
    override func viewDidLoad() {
        
  //    let fetchRequestResult: NSFetchRequest<UserPL> = UserPL.fetchRequest()

  //    preloadDataTwo()
      configureFetchedResultsController()
        
        
        datatableView.dataSource = self
        datatableView.dataSource = self
        
        
     // refering to plist with NSDictionary, this is to count number of items
    
        
        
    }
    
    //Mark: - Preload Data
    
    
    func preloadDataTwo() {
        
        
        let dicRoot = NSDictionary.init(contentsOfFile: Bundle.main.path(forResource: "UserDataThree", ofType: "plist")!)
        
        let nameArrayFromDict: NSArray = NSArray.init(object: dicRoot!.object(forKey: "name") as Any)
        nameValueArray = nameArrayFromDict.object(at: 0) as! NSArray
        
        let emailArrayFromDict: NSArray = NSArray.init(object: dicRoot!.object(forKey: "email") as Any)
        emailValueArray = emailArrayFromDict.object(at: 0) as! NSArray
        
        
        for count in 0..<nameValueArray.count {
            print(nameValueArray[count])
        }
        
        for count in 0..<emailValueArray.count {
            print(emailValueArray[count])
        }
        
                for nameValue in nameValueArray as! [String] {
                    
                    let user = UserPL(context: managedContext)
                    user.name = nameValue
            
                }

               for emailValue in emailValueArray as! [String] {
                
                    let user = UserPL(context: managedContext)
                    user.email = emailValue

               }
        
        
//        do {
        

            try? managedContext.save()
        
            
//        } catch {
//
//            print(error.localizedDescription)
//    }
}

        
    
    
    func preloadData() {
        
//        let filePath = Bundle.main.path(forResource: "UserDataOne", ofType: "plist")
//
//        if let arrayContents = NSArray(contentsOfFile: filePath!) {
//
//            let nameValue = arrayContents.value(forKey: "email") as! [String]
//            let emailValue = arrayContents.value(forKey: "name") as! [String]
//
////            print (nameValue)
////            print (emailValue)
//
//            do {
//
//
//                for name in nameValue {
//
//                    let userObject = UserPL(context: managedContext)
//
//                    userObject.name = name
//
//                    print(name)
//
//                    }
//
//
//                for email in emailValue {
//
//                    let userObject = UserPL(context: managedContext)
//
//                    userObject.email = email
//
//                    print(email)
//
//                }
//
//
//                try
//
//                    managedContext.save()
//
//            } catch {
//
//                print(error.localizedDescription)
//            }
//      }
}
   

    
    //Mark: - Fetch Data
    
    private func configureFetchedResultsController() {
        
        //use this method when using app delegate as uiappdelegate method
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return
        }
        
        let context = appDelegate.persistentContainer.viewContext
        let fetchRequest: NSFetchRequest<UserPL> = UserPL.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "name", ascending: true)
        fetchRequest.sortDescriptors = [sortDescriptor]
        
        fetchResultController = NSFetchedResultsController(fetchRequest: fetchRequest, managedObjectContext: appDelegate.persistentContainer.viewContext, sectionNameKeyPath: nil, cacheName: nil) as? NSFetchedResultsController<NSFetchRequestResult> as! NSFetchedResultsController<UserPL>
        
        fetchResultController?.delegate = self
        
        do  {
            
            try fetchResultController?.performFetch()
            if let fetchedObjects = fetchResultController?.fetchedObjects {
            
                  user = fetchedObjects as [UserPL]
           //     user = fetchedObjects
                
                }
            
            
            /// try to frame items into number of array here...
            
//            try fetchResultController?.performFetch()
//
//            if let fetchedObjects = fetchResultController?.fetchedObjects {
//
//                 user = fetchedObjects as! [UserPL]
//
//                }
            
        
        } catch {
            print(error.localizedDescription)
        }
        
    }
    
    
    //Mark: - TableDataView Source
    
    func numberOfSections(in tableView: UITableView) -> Int {
        
        if user.count > 0 {
            datatableView.backgroundView?.isHidden = true
            datatableView.separatorStyle = .singleLine
        } else {
            datatableView.backgroundView?.isHidden = false
            datatableView.separatorStyle = .none
        }
        
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    
//        guard let sections = fetchResultController?.sections else {
//              return 0
//        }
//
//        let rowCount = sections[section].numberOfObjects
//
//            print("The amount of rows in the section are: \(rowCount)")
//
//            return rowCount
        
         return user.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
        let cell = tableView.dequeueReusableCell(withIdentifier: "usercell", for: indexPath) as! SideTableViewCell
        
        //please use as? String.. cause data model needs to know where is data!!!!!
        
        
//            let addeduser = user[indexPath.row]
//
//            cell.nameLabel.text = addeduser.name
//            cell.emailLabel.text = addeduser.email
        
        
//        if let usero = fetchResultController?.object(at: indexPath) as? UserPL {
//
//            cell.textLabel?.text = usero.value(forKey: "name") as? String
//            cell.detailTextLabel?.text = usero.value(forKey: "email") as? String
//        }
        
          if let usero = fetchResultController?.object(at: indexPath) as? UserPL {

                    cell.nameLabel.text = usero.value(forKey: "name") as? String
                    cell.emailLabel.text = usero.value(forKey: "email") as? String

            }
        
        return cell
        
    }
    
}

//// You can use code below to generate number and graphs..
//fetchRequest.propertiesToGroupBy = ["name"]
//let ced = NSExpressionDescription()
//ced.expression = NSExpression(forFunction: "count:", arguments: [NSExpression(forKeyPath: "name")])
//
//ced.name = "count"
//ced.expressionResultType = .integer64AttributeType --> look at other attribute type!
//
//fetchRequest.propertiesToFetch = ["name",ced]
//
//print ("count")
