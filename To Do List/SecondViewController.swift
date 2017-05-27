import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet var todo: UITextField!
    @IBOutlet var descri: UITextField!

    @IBOutlet var button: UIButton!
    var todoarray = [String]()
    var todoarraydate = [Date]()
    var todoarraydescrip = [String]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        _ = Timer.scheduledTimer(timeInterval: 0.001, target: self, selector: #selector(SecondViewController.check), userInfo: nil
            , repeats: true)
        if UserDefaults.standard.array(forKey: "todoarray") == nil {
            todoarray = [String]()
        } else {
            todoarray = UserDefaults.standard.array(forKey: "todoarray") as! [String]
        }
        
        if UserDefaults.standard.array(forKey: "todoarraydate") == nil {
            todoarraydate = [Date]()
        } else {
            todoarraydate = UserDefaults.standard.array(forKey: "todoarraydate") as! [Date]
        }
        
        if UserDefaults.standard.array(forKey: "todoarraydescrip") == nil {
            todoarraydescrip = [String]()
        } else {
            todoarraydescrip = UserDefaults.standard.array(forKey: "todoarraydescrip") as! [String]
        }
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBAction func addtodo(_ sender: AnyObject) {
        let statictodo = todo.text!
        let descrip = descri.text!
        todoarray.append(statictodo)
        todoarraydate.append(Date.init(timeIntervalSinceNow: 0))
        todoarraydescrip.append(descrip)
        todo.text = ""
        descri.text = ""
        UserDefaults.standard.set(todoarray, forKey: "todoarray")
        UserDefaults.standard.set(todoarraydate, forKey: "todoarraydate")
        UserDefaults.standard.set(todoarraydescrip, forKey: "todoarraydescrip")
        
        self.performSegue(withIdentifier: "Return", sender: self)
    }
    
    func check() {
        if todo.text == "" || descri.text == "" {
            button.isHidden = true
        } else {
            button.isHidden = false
        }
    }

}

