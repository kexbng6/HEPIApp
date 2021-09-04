//
//  EventViewController.swift
//  HEPIApp
//
//  Created by Kevin Bonga on 25.08.21.
//  Copyright © 2021 Kevin Bonga. All rights reserved.
//

import EventKitUI
import EventKit
import UIKit

//struct Event{
//    let name : String
//    let time : String
//    //let time : Date
//}

var name :  [String] =  []
var time :  [Date] = []

class EventViewController: UIViewController, EKEventViewDelegate {

    @IBOutlet weak var tbViewController: UITableView!
    let store = EKEventStore()

    //var dataSource: [Event] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tbViewController.dataSource = self
        loadDatatb()
        
       // let vc = EKEventViewController
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .add, target: self, action: #selector(didTapAdd))
        // Do any additional setup after loading the view.
    }
    
    func loadDatatb(){
        
//        dataSource.append(Event(name: "On est al", time: "oui le foot"))
//        dataSource.append(Event(name: "Wesh la miff", time: "oui le foot"))
//        dataSource.append(Event(name: "Okay okay", time: "oui le foot"))
        
        let eventStore = EKEventStore()
        let calendars = eventStore.calendars(for: .event)

        for cal in calendars{
            if cal.title == "HEPIApp"{
                let oneMonthAgo = NSDate(timeIntervalSinceNow: -30*24*3600)
                let oneMonthAfter = NSDate(timeIntervalSinceNow: +30*24*3600)
                let predicate = eventStore.predicateForEvents(withStart: oneMonthAgo as Date, end: oneMonthAfter as Date, calendars: [cal])

                let events = eventStore.events(matching: predicate)

                for evnt in events{
                    name.append(evnt.title)
                    time.append(evnt.startDate)
                    //dataSource.append(Event(name: evnt.title, time: evnt.startDate))
                    //dataSource.append(evnt.startDate! as NSDate)
                    //dataSource.append(evnt.endDate! as NSDate)
                }
            }
        }
    }
    
        //@IBOutlet weak var name: UILabel!
        //@IBOutlet weak var time: UILabel!
        
    

    
    
    func calendarExist()-> EKCalendar{
        var retCal: EKCalendar?
        let eventStore = EKEventStore()
        let calendars = eventStore.calendars(for: .event)
        
        for cal in calendars{
            if cal.title == "HEPIApp"{
                retCal = cal
                return retCal!
            }
        }
        return retCal!
    }
    
    @objc func didTapAdd(){
        
        store.requestAccess(to: .event) {[weak self] success, error in
            if success, error == nil{
                DispatchQueue.main.async {
                    guard let store = self?.store else {return}
                    
                    let newEvent = EKEvent(eventStore: store)
                    newEvent.startDate = Date()
                    newEvent.endDate = Date()
                    newEvent.title = "Examen de "
//                    if self?.calendarExist() != nil{
//                        print("sa mere la pute")
//                        newEvent.calendar =  self!.calendarExist()
//                    }
//                    else{
//                        print("ton pere le chauve")
//                    }
      
                    let otherVC = EKEventEditViewController()
                    otherVC.eventStore = store
                    otherVC.event = newEvent
                    self?.present(otherVC, animated: true, completion: nil)
                    
                  /*  let vc = EKEventViewController()
                    vc.delegate = self
                    vc.event = newEvent
                    let navVC = UINavigationController(rootViewController: vc)
                    self?.present(navVC, animated: true)*/
                }
            }
        }
    }

    
    func eventViewController(_ controller: EKEventViewController, didCompleteWith action: EKEventViewAction) {
        controller.dismiss(animated: true, completion: nil)
    }
    
}

extension EventViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return name.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let eventCell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? EvenvetTableViewCell else{
            return UITableViewCell()
        }
//        var titles :  [String] = []
//        var startDates :  [NSDate] = []
//        var endDates :  [NSDate] = []
        
        let eventName = name[indexPath.row]
        let eventDate = time[indexPath.row]
        
        eventCell.nomEvent.text = eventName
        eventCell.dateEvent.text = "\(eventDate)"

        return eventCell
    }
}


