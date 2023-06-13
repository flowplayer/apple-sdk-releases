//
//  ViewController.swift
//  iOS Example (UIKit)
//
//  Created by Wolf on 01/06/2023.
//

import FlowplayerSDK
import UIKit

class ViewController: UIViewController {
  // - Private
  // - Constants
  private static let cellId = "MyCellId"
  private static let segueId = "PlayControllerSegue"

  // - Props
  lazy var dataSource = loadVideoList()

  // - Internal
  // - IBOutlets & Views
  @IBOutlet var tableView: UITableView!

  // - Lifecycle
  override func viewDidLoad() {
    super.viewDidLoad()
    tableView.dataSource = self
    tableView.delegate = self
    tableView.tableFooterView = .init()
  }
}

// MARK: - UITableViewDataSource

extension ViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let video = dataSource[indexPath.row]
    let cell = UITableViewCell(style: .default, reuseIdentifier: Self.cellId)
    var config = cell.defaultContentConfiguration()

    config.image = UIImage(named: video.thumbnail)
    config.imageProperties.maximumSize = .init(width: 100, height: 100)
    config.imageProperties.cornerRadius = 10
    config.text = video.title
    config.secondaryText = video.description
    config.secondaryTextProperties.lineBreakMode = .byTruncatingTail
    config.secondaryTextProperties.numberOfLines = 1
    cell.contentConfiguration = config

    return cell
  }
}

// MARK: - UITableViewDelegate

extension ViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    tableView.deselectRow(at: indexPath, animated: true)
    let selectedItem = dataSource[indexPath.row]
    performSegue(withIdentifier: Self.segueId, sender: selectedItem)
  }
}

// MARK: - Navigation

extension ViewController {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    guard let playController = segue.destination as? PlayController else {
      return
    }

    playController.video = sender as? Video
  }
}
