//
//  StudentTableViewController.swift
//  ManagementStudents
//
//  Created by Tran Van Tin on 5/6/17.
//  Copyright © 2017 Tran Van Tin. All rights reserved.
//

import UIKit

class StudentTableViewController: UITableViewController, UISearchBarDelegate, UISearchResultsUpdating {
    
    let searchController = UISearchController(searchResultsController: nil)
    var filteredStudents = [Student]()
    var students: [Student] = {
        return StudentList.students()
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.leftBarButtonItem = self.editButtonItem
        searchController.searchResultsUpdater = self
        searchController.hidesNavigationBarDuringPresentation = false
        searchController.dimsBackgroundDuringPresentation = false
        searchController.searchBar.sizeToFit()
        self.tableView.tableHeaderView = searchController.searchBar
        definesPresentationContext = true
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
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredStudents.count
        }
        return students.count
    }


    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "studentCell", for: indexPath)
        let student: Student
        if searchController.isActive && searchController.searchBar.text != "" {
            student = filteredStudents[indexPath.row]
        } else {
            student = students[indexPath.row]
        }
        cell.textLabel?.text = student.name
        cell.detailTextLabel?.text = student.university

        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
    }
    
    func filterContentForSearchText(searchText: String) {
        filteredStudents = students.filter { student in
            return  student.name.lowercased().contains(searchText.lowercased())
        }
        tableView.reloadData()
    }
    
    func updateSearchResults(for searchController: UISearchController) {
        filterContentForSearchText(searchText: searchController.searchBar.text!)
    }
    
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        if searchController.isActive && searchController.searchBar.text != "" {
            return false
        } else {
            return true
        }
    }

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            if searchController.isActive && searchController.searchBar.text != "" {
                filteredStudents.remove(at: indexPath.row)
            } else {
                students.remove(at: indexPath.row)
            }
            
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {
        let student = students[fromIndexPath.row]
        students.remove(at: fromIndexPath.row)
        students.insert(student, at: to.row)
    }

    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        if searchController.isActive && searchController.searchBar.text != "" {
            return false
        } else {
            return true
        }
    }
    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let identifier = segue.identifier {
            switch identifier {
            case "StudentDetail":
                let studentDetailVC = segue.destination as! StudentDetailViewController
                if let indexPath = self.tableView.indexPathForSelectedRow {
                    studentDetailVC.student = studentAtIndexPath(indexPath: indexPath as NSIndexPath)
                }
                break
                
            default:
                break
            }
        }
    }
    
    // MARK: - Helper Method
    
    func studentAtIndexPath(indexPath: NSIndexPath) -> Student
    {
        if searchController.isActive && searchController.searchBar.text != "" {
            return filteredStudents[indexPath.row]
        } else {
            return students[indexPath.row]
        }
    }

}
