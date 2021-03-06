//
//  SoundViewController.swift
//  EggTimer
//
//  Created by 김민지 on 2022/05/28.
//  알림음 변경 화면 ViewController

import AVFoundation
import UIKit

final class SoundViewController: UIViewController {
    static let identifier = "SoundViewController"
    
    var player: AVAudioPlayer!
    
    @IBOutlet weak var tableview: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setupAppearance()
    }
    
    func setupAppearance() {
        DarkModeManager.applyAppearance(
            mode: DarkModeManager.getAppearance(),
            viewController: self
        )
    }
}

// MARK: - UITableView
extension SoundViewController: UITableViewDataSource, UITableViewDelegate {
    /// 셀 개수
    func tableView(
        _ tableView: UITableView,
        numberOfRowsInSection section: Int
    ) -> Int {
        return 6
    }
    
    /// 셀 구성
    func tableView(
        _ tableView: UITableView,
        cellForRowAt indexPath: IndexPath
    ) -> UITableViewCell {
        
        guard let cell = tableView.dequeueReusableCell(
            withIdentifier: SoundCell.identifier
        ) as? SoundCell else { return UITableViewCell() }
        
        cell.update(indexPath.row)
        return cell
    }
    
    /// 셀 클릭
    func tableView(
        _ tableView: UITableView,
        didSelectRowAt indexPath: IndexPath
    ) {
        let sound = Sound(rawValue: indexPath.row)!
        SoundManager.setSound(sound: sound)
        
        tableView.reloadData()
        
        let soundName = String(indexPath.row+1)
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "wav") else { return }
        
        do {
            player = try AVAudioPlayer(contentsOf: url)
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
