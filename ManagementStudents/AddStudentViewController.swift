//
//  AddStudentViewController.swift
//  ManagementStudents
//
//  Created by Tran Van Tin on 5/6/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class AddStudentViewController: UIViewController {
    
    @IBOutlet var txtYearOld: UITextField!
    @IBOutlet var txtDescription: UITextView!
    @IBOutlet var txtName: UITextField!
    @IBOutlet var txtUniversity: UITextField!
    @IBOutlet weak var btmConstraint: NSLayoutConstraint!
    
    var keyboardIsShow = false
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        txtYearOld.keyboardType = UIKeyboardType.decimalPad
        NotificationCenter.default.addObserver(self, selector: #selector(AddStudentViewController.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        
        NotificationCenter.default.addObserver(self, selector: #selector(AddStudentViewController.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func btnSave(_ sender: Any) {
        if txtName.text!.isEmpty || txtUniversity.text!.isEmpty || txtDescription.text!.isEmpty || txtYearOld.text!.isEmpty {
            // Thong bao nhap thieu thong tin
            let alert = UIAlertController(title: "Error", message: "Missing Information!", preferredStyle: UIAlertControllerStyle.alert);
            alert.addAction(UIAlertAction(title: "Ok", style: UIAlertActionStyle.default, handler: nil));
            self.present(alert, animated: true, completion: nil);
        }
        else {
            TempStudent.check = true
            let student: Student = Student(name: txtName.text!, university: txtUniversity.text!, description: txtDescription.text!, yearOld: Int(txtYearOld.text!)!)
            TempStudent.student = student
            self.navigationController?.popViewController(animated: true)
        }
    }

    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtName.resignFirstResponder()
        txtUniversity.resignFirstResponder()
        txtDescription.resignFirstResponder()
        txtYearOld.resignFirstResponder()
        return true
    }
    
    @IBAction func userTappedBackground(sender: AnyObject){
        txtName.resignFirstResponder()
        txtUniversity.resignFirstResponder()
        txtDescription.resignFirstResponder()
        txtYearOld.resignFirstResponder()
    }
    
    @IBAction func userTappedBackground(_ sender: Any) {
        view.endEditing(true)
    }

    func keyboardWillShow(notification:NSNotification) {
        
        //Nếu keyboard đã mơ rồi thì không thực hiện đẩy nữa
        if !keyboardIsShow {
            adjustingHeight(show: true, notification: notification)
            keyboardIsShow = true
        }
    }
    
    func keyboardWillHide(notification:NSNotification) {
        if keyboardIsShow {
            adjustingHeight(show: false, notification: notification)
            keyboardIsShow = false
        }
        
    }
    
    //thay đổi thông số của constrant bottomConstraint để nó nằm trên bàn phím ảo
    func adjustingHeight(show:Bool, notification:NSNotification) {
        var userInfo = notification.userInfo!
        let keyboardFrame:CGRect = (userInfo[UIKeyboardFrameBeginUserInfoKey] as! NSValue).cgRectValue
        
        let animationDurarion = userInfo[UIKeyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        let changeInHeight = (keyboardFrame.height) * (show ? 1 : -1)
        
        UIView.animate(withDuration: animationDurarion, animations: { () -> Void in
            self.btmConstraint.constant += changeInHeight
        })
        
    }
}
