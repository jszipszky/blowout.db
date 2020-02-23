//
//  ViewController.swift
//  SQLite_For_Blowout
//
//  Created by Jackson McCluskey on 2/22/20.
//      Fork: Jack Szipszky on 2/23/20
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
    let eventcontact = Expression<Int>("eventcontact")
    let eventnote = Expression<String>("eventnote")
    
    
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
        table.column(self.eventcontact)
        table.column(self.eventnote)
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
    
    @IBAction func insertEvent() {
        print("INSERT EVENT TAPPED")
        
        let alert = UIAlertController(title: "Insert Event", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "Name" }
        alert.addTextField { (tf) in tf.placeholder = "Country" }
        alert.addTextField { (tf) in tf.placeholder = "State" }
        alert.addTextField { (tf) in tf.placeholder = "City" }
        alert.addTextField { (tf) in tf.placeholder = "Venue" }
        alert.addTextField { (tf) in tf.placeholder = "Date" }
        alert.addTextField { (tf) in tf.placeholder = "Start" }
        alert.addTextField { (tf) in tf.placeholder = "End" }
        alert.addTextField { (tf) in tf.placeholder = "Gathering" }
        alert.addTextField { (tf) in tf.placeholder = "Contact" }
        alert.addTextField { (tf) in tf.placeholder = "Note" }       
        
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard
                let name = alert.textFields![0].text,
                let country = alert.textFields![1].text,
                let state = alert.textFields![2].text,
                let city = alert.textFields![3].text,
                let venue = alert.textFields![4].text,
                let date = alert.textFields![5].text,
                let start = alert.textFields![6].text,
                let end = alert.textFields![7].text,
                let gathering = alert.textFields![8].text,
                let contact = alert.textFields![9].text,
                let note = alert.textFields![10].text,
                else { return }
            print(name)
            print(country)
            print(state)
            print(city)
            print(venue)
            print(date)
            print(start)
            print(end)
            print(gathering)
            print(contact)
            print(note)
            
            let insertEvent = self.eventsTable.insert(
                self.eventtitle <- name,
                self.eventcountry <- country,
                self.eventstate <- state,
                self.eventcity <- city,
                self.eventvenue <- venue,
                self.eventdate <- date,
                self.eventstart <- start,
                self.eventend <- end,
                self.eventgathering <- gathering,
                self.eventcontact <- contact,
                self.eventnote <- note)
            
            do {
                try self.database.run(insertEvent)
                print("INSERTED EVENT")
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
    
    @IBAction func listEvents() {
        print("LIST EVENTS TAPPED")
        
        do {
            let events = try self.database.prepare(self.eventsTable)
            for event in events {
                print("eventId: \(event[self.eventid]), 
                       name: \(event[self.eventtitle]),
                       country: \(event[self.eventcountry]),
                       state: \(event[self.eventstate]),
                       city: \(event[self.eventcity]),
                       venue: \(event[self.eventvenue]),
                       date: \(event[self.eventdate]),
                       start: \(event[self.eventstart]),
                       end: \(event[self.eventend]),
                       gathering: \(event[self.eventgathering]),
                       contact: \(event[self.eventcontact]),
                       note: \(event[self.eventnote])")
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
        let alert = UIAlertController(title: "Delete User", message: nil, preferredStyle: .alert)
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
        
    @IBAction func deleteEvent() {
        print("DELETE EVENT TAPPED")
        let alert = UIAlertController(title: "Delete Event", message: nil, preferredStyle: .alert)
        alert.addTextField { (tf) in tf.placeholder = "Event ID" }
        let action = UIAlertAction(title: "Submit", style: .default) { (_) in
            guard let eventIdString = alert.textFields?.first?.text,
                let eventId = Int(eventIdString)
            else { return }
            print(eventIdString)
            
            let event = self.eventsTable.filter(self.eventid == eventId)
            let deleteEvent = event.delete()
            
            do {
                try self.database.run(deleteEvent)
            }
            catch {
                print(error)
            }
            
        }
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }

}

