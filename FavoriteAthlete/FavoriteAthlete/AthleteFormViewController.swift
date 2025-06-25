//
//  AthleteFormViewController.swift
//  FavoriteAthlete
//
//  Created by Lydia Reynolds on 6/18/25.
//

import UIKit

class AthleteFormViewController: UIViewController {
    
    struct PropertyKeys {
        static let unwindToListSegue = "unwindToAthleteTableViewController"
    }
    
    @IBOutlet var nameLabel: UITextField!
    @IBOutlet var ageLabel: UITextField!
    @IBOutlet var leagueLabel: UITextField!
    @IBOutlet var teamLabel: UITextField!
    
    @IBAction func saveButton(_ sender: Any) {
        guard let name = nameLabel.text,
            let ageString = ageLabel.text,
            let age = Int(ageString),
            let league = leagueLabel.text,
              let team = teamLabel.text else {
            return
        }
            
            athlete = Athlete(name: name, age: age, league: league, team: team)
        
        performSegue(withIdentifier: PropertyKeys.unwindToListSegue, sender: self)
        
    }
    
    var athlete: Athlete?

    override func viewDidLoad() {
        super.viewDidLoad()
        updateView()

        // Do any additional setup after loading the view.
    }
    
    init?(coder: NSCoder, athlete: Athlete?) {
        self.athlete = athlete
        super.init(coder: coder)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func updateView() {
        guard let athlete = athlete else {
            return }
        
        nameLabel.text = athlete.name
        ageLabel.text = String(athlete.age)
        leagueLabel.text = athlete.league
        teamLabel.text = athlete.team
    }
    
    
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
