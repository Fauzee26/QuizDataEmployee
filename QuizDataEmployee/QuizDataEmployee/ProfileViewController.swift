//
//  ProfileViewController.swift
//  QuizDataEmployee
//
//  Created by Muhammad Hilmy Fauzi on 27/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {

     @IBOutlet weak var labelUsername: UILabel!
     @IBOutlet weak var labelStaff: UILabel!
     @IBOutlet weak var labelGolongan: UILabel!
     @IBOutlet weak var labelSalary: UILabel!
     @IBOutlet weak var labelID: UILabel!
    
    var passName:String?
    var passStaff:String?
    var passGolongan:String?
    var passSalary:String?
    var passID:String?
    override func viewDidLoad() {
        
        labelUsername.text = "Your Username is " + passName!
        labelStaff.text = "Your Staff is " + passStaff!
        labelGolongan.text = "Your Golongan is " + passGolongan!
        labelSalary.text = "Your Salary is " + passSalary!
        labelID.text = "Your ID is " + passID!
        
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
