//
//  ParrotEntryTableViewController.swift
//  FinalParrotTraining
//
//  Created by Javier Perez on 8/11/21.
//

import UIKit

class ParrotEntryTableViewController: UITableViewController {
    
    //array to hold entries
    
    var parrotEntries: [Entry] = []
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
    
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        
        if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
            
            //grabbing objects.
            
        
            
            if let entriesFromCoreData = try? context.fetch(Entry.fetchRequest()) as? [Entry]{
                
                
                parrotEntries = entriesFromCoreData
                tableView.reloadData()
                
                
                
            }
            
            
            
            
            
        }
        
    }
    
    
    
    
    
    
    

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return parrotEntries.count
    }
    
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "EntryCell") as? EntryTableViewCell {
        
        let entry = parrotEntries[indexPath.row]
            
            cell.entryText.text = entry.text
            cell.monthLabel.text = entry.month()
            cell.dayLabel.text = entry.day()
        
        //cell.textLabel?.text = entry.text
        
        return cell
        }else {
            return UITableViewCell()
        }
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let entry = parrotEntries[indexPath.row]
        performSegue(withIdentifier: "segueToParrotEntry", sender: entry)
    }
    
    
    
    //making sure that it gets the row of the cell at 100
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let entryVC = segue.destination as? EntryViewController {
        
            if let entryToBeSent = sender as? Entry {
                
                entryVC.entry = entryToBeSent
                
            }
        }
    }


}
