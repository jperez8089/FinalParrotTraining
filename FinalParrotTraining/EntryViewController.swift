//
//  EntryViewController.swift
//  FinalParrotTraining
//
//  Created by Javier Perez on 8/11/21.
//

import UIKit

class EntryViewController: UIViewController, UITextViewDelegate {
    
    @IBOutlet weak var datePicker: UIDatePicker!
    
    @IBOutlet weak var parrotEntryTextView: UITextView!
    
// variable so that the entries can actually be displayed upon entering
    
    var entry: Entry?
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        if entry == nil {
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                
                 entry = Entry(context: context)
                
                entry?.date = datePicker.date
                entry?.text = parrotEntryTextView.text
                parrotEntryTextView.becomeFirstResponder()
                
               
                
            }
            }
        parrotEntryTextView.text = entry?.text
        if let dateToBeShown = entry?.date{
            datePicker.date = dateToBeShown
        }
        
        parrotEntryTextView.delegate = self
        
    }
   
    
    override func viewWillDisappear(_ animated: Bool) {
        // begin to add to the table view
        
       //entry?.date = datePicker.date
       //entry?.text = parrotEntryTextView.text
            
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
            
            
            
        }
        
    @IBAction func deleteButton(_ sender: Any) {
        
        if entry != nil {
            
            
            if let context = (UIApplication.shared.delegate as? AppDelegate)?.persistentContainer.viewContext {
                
                context.delete(entry!)
               try? context.save()
            
            }
        }
        
        navigationController?.popViewController(animated: true)
        
    }
    
    func textViewDidChange(_ textView: UITextView) {
        entry?.text = parrotEntryTextView.text
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
    
    
    @IBAction func datePickerChanged(_ sender: Any) {
        
        entry?.date = datePicker.date
        (UIApplication.shared.delegate as? AppDelegate)?.saveContext()
    }
    
    
        
        }
    
    
    


