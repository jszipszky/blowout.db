//
//  ViewController.swift
//  SQLite_For_Blowout
//
//  Created by Jackson McCluskey on 2/22/20.
//  Copyright © 2020 Team 21. All rights reserved.
//

import UIKit
import SQLite

class ViewController: UIViewController {

    var database: Connection!
    
    let usersTable = Table("users")
    let userid = Expression<Int>("userid")
    let useremail = Expression<String>("useremail")
    let userpassword = Expression<String>("userpassword")
    let userphone = Expression<String>("userphone")
    let usercountry = Expression<String>("usercountry")
    let userstate = Expression<String>("userstate")
    let usercity = Expression<String>("usercity")
    let useraddress = Expression<String>("useraddress")
    
    let eventsTable = Table("events")
    let eventid = Expression<Int>("eventid")
    let eventtitle = Expression<String>("eventtitle")
    let eventcountry = Expression<String>("eventcountry")
    let eventstate = Expression<String>("eventstate")
    let eventcity = Expression<String>("eventcity")
    let eventvenue = Expression<String>("eventvenue")
    let eventdate = Expression<String>("eventdate")
    let eventstart = Expression<Int>("eventstart")
    let eventend = Expression<Int>("eventend")
    let eventgathering = Expression<String>("eventgathering")
    
    
    // CREATE
    // email
    // password
    // confirm
    // phone
    
    // PROFILE
    // email
    // phone
    // country
    // state
    // city
    // address
    
    // EVENT
    // Title
    // Country
    // State
    // City
    // Venue
    // Date
    // Start Time
    // End Time
    // Gathering
    // Contact Number
    // Facility
    // Picture
    // Note
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            let documentDirectory = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: true)
            
            let fileUrl = documentDirectory.appendingPathComponent("users").appendingPathExtension("sqlite3")
            
            let database = try Connection(fileUrl.path)
            self.database = database
        }
        catch {
            print(error)
        }
    }

    @IBAction func createUserTable() {
        print("CREATE TAPPED")
        
        let createTable = self.usersTable.create { (table) in
            table.column(self.userid, primaryKey: true)
            table.column(self.useremail, unique: true)
            table.column(self.userpassword)
            table.column(self.userphone)
            table.column(self.usercountry)
            table.column(self.userstate)
            table.column(self.usercity)
            table.column(self.useraddress)
        }
        
        do {
            try self.database.run(createTable)
            print("Created Table")
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func createEventTable() {
      print("EVENT TAPPED")
      
      let createTable = self.eventsTable.create { (table) in
        table.column(self.eventid, primaryKey : true)
        table.column(self.eventtitle)
        table.column(self.eventcountry)
        table.column(self.eventstate)
        table.column(self.eventcity)
        table.column(self.eventvenue)
        table.column(self.eventdate)
        table.column(self.eventstart)
        table.column(self.eventend)
        table.column(self.eventgathering)
      }
      
      do {
        try self.database.run(createTable)
        print("Created event table")
      }
      catch {
        print(error)
      }
    }

    
    @IBAction func insertUser() {
        print("INSERT TAPPED")
        
        let alert = UIAlertController(title: "Insert User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "Name" }
        alert.addTextField { (tf) in tf.placeholder = "Email" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let name = alert.textFields?.first?.text,
                let email = alert.textFields?.last?.text
                else { return }
            print(name)
            print(email)
            
            let insertUser = self.usersTable.insert(self.name <- name, self.email <- email)
            
            do {
                try self.database.run(insertUser)
                print("INSERTED USER")
            }
            catch {
                print(error)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func listUsers() {
        print("LIST TAPPED")
        
        do {
            let users = try self.database.prepare(self.usersTable)
            for user in users {
                print("userId: \(user[self.id]), name: \(user[self.name]), email: \(user[self.email])")
            }
        }
        catch {
            print(error)
        }
    }
    
    @IBAction func updateUser() {
        print("UPDATE TAPPED")
        let alert = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "User ID" }
        alert.addTextField { (tf) in tf.placeholder = "Email" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let userIdString = alert.textFields?.first?.text,
                let userId = Int(userIdString),
                let email = alert.textFields?.last?.text
                else { return }
            print(userIdString)
            print(email)
            
            let user = self.usersTable.filter(self.id == userId)
            
            let updateUser = user.update(self.email <- email)
            do {
                try self.database.run(updateUser)
            }
            catch {
                print(error)
            }
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func deleteUser() {
        print("DELETE TAPPED")
        let alert = UIAlertController(title: "Update User", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "User ID" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let userIdString = alert.textFields?.first?.text,
                let userId = Int(userIdString)
            else { return }
            print(userIdString)
            
            let user = self.usersTable.filter(self.id == userId)
            let deleteUser = user.delete()
            
            do {
                try self.database.run(deleteUser)
            }
            catch {
                print(error)
            }
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

