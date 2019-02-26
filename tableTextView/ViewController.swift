//
//  ViewController.swift
//  tableTextView
//
//  Created by 古賀賢司 on 2019/02/24.
//  Copyright © 2019 古賀賢司. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextViewDelegate {
    
    var memo:String?

    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var saveButton: UIBarButtonItem!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if let memo = self.memo{
            textView.text = memo
        }
    }
    
    @IBAction func cancel(_ sender: Any) {
        if presentingViewController is UINavigationController{
            self.dismiss(animated: true, completion: nil)
        }else{
            navigationController?.popViewController(animated: true)
        }
        
    }
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let button = sender as? UIBarButtonItem, button == saveButton else { //buttonによる遷移の管理
            return //他のボタンだと遷移しない
        }
        self.memo = self.textView.text ?? ""
    }
}
