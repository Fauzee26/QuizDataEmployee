//
//  MainMenuTableViewController.swift
//  QuizDataEmployee
//
//  Created by Muhammad Hilmy Fauzi on 27/10/17.
//  Copyright © 2017 Hilmy Corp. All rights reserved.
//

import UIKit

class MainMenuTableViewController: UITableViewController {
    
    var employee : [Employee] = [] //this data taked from entity name
    var fullnameSelected:String?
    var staffSelected:String?
    var golonganSelected:String?
    var salarySelected:String?
    var IDSelected:String?
    
    let context = (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return employee.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellTable", for: indexPath) as! DisplayTableViewCell

        // Configure the cell...
        let dataTask = employee[indexPath.row]
        if let myDataTask = dataTask.employee_name {
            cell.labelNAME.text = myDataTask
        }
        if let myDataTask1 = dataTask.employee_staff {
            cell.labelSTAFF.text = myDataTask1
        }
        if let myDataTask2 = dataTask.employee_golongan{
            cell.labelGOLONGAN.text = myDataTask2
        }
        if let myDataTask2 = dataTask.employee_salary{
            cell.labelSALARY.text = myDataTask2
        }


        return cell
    }
    override func viewWillAppear(_ animated: Bool) {
        //memanggil method getData
        getData()
        //memanggil reloadData
        tableView.reloadData()
    }
    
    //method getData
    func getData() {
        //mengecek apakah ada error atau tidak
        do{
            //kondisi kalau tidak ada error
            //maka akan request download data
            employee = try context.fetch(Employee.fetchRequest())
        }
        catch{
            //kondisi apabila error fetch data
            print("Fetching Failed")
        }
    }
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath){
        //mengece menu swipe bila edit data
        if editingStyle == .delete {
            let task = employee[indexPath.row]
            context.delete(task)
            //Delete data
            (UIApplication.shared.delegate as! AppDelegate).saveContext()
            
            do{
                //retrieve data
                employee = try context.fetch(Employee.fetchRequest())
            }
            catch{
                print("Fetching Failed")
            }
        }
        //load data again
        tableView.reloadData()
    }
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath){
        //mengecek data yang dikirim
        print("Row \(indexPath.row)selected")
        
        let dataTask = employee[indexPath.row]
        //memasukan data ke variable namaSelected dan image selected ke masing masing variable nya
        fullnameSelected = dataTask.employee_name
        staffSelected = dataTask.employee_staff
        golonganSelected = dataTask.employee_golongan
        salarySelected = dataTask.employee_salary
        IDSelected = dataTask.employee_id
        //memamnggil segue passDataDetail
        performSegue(withIdentifier: "passData", sender: self)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //mengecek apakah segue nya ada atau  tidak
        if segue.identifier == "passData"{
            //kondisi ketika segue nya ada
            //mengirimkan data ke detailViewController
            let sendData = segue.destination as! ProfileViewController
            sendData.passName = fullnameSelected
            sendData.passStaff = staffSelected
            sendData.passGolongan = golonganSelected
            sendData.passSalary = salarySelected
            sendData.passID = IDSelected
        }
    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
