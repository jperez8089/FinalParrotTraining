import AVFoundation

import UIKit

class ClickerViewController: UIViewController {

    @IBOutlet weak var clickerButton: UIButton!
    
    
    var clickerSound : AVAudioPlayer?
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    
        
        
        clickerButton.backgroundColor = UIColor.init(red: 48/255, green: 173/255, blue: 99/255, alpha: 1)
        
        clickerButton.layer.cornerRadius = 30.0
        clickerButton.tintColor = UIColor.white
        
        // Do any additional setup after loading the view.
    }
    
    @IBAction func didTapButton(_ sender: Any) {
        
        let sound = Bundle.main.path(forResource: "clickersound", ofType: "mp3")!
        
        let url = URL(fileURLWithPath: sound)
        
        
        do
        {
            clickerSound = try AVAudioPlayer(contentsOf: url)
            clickerSound?.play()
            
        }
    catch {
    
    print("error")
    
    }
    
}

}
