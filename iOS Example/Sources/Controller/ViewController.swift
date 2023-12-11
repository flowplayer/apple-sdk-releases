//
//  ViewController.swift
//  iOS Example
//
//  Created by @rashadatjou on 01/06/2023.
//  Copyright © 2023 Wowza. All rights reserved.
//

import FlowplayerSDK
import UIKit

class ViewController: UIViewController {
  // - Private
  // - Constants
  private static let cellId = "MyCellId"
  private static let segueSinglePlayerId = "SinglePlayerSegue"
  private static let segueMultiPlayerId = "MultiPlayerSegue"
  private static let segueNowPlayingId = "NowPlayingSegue"

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
  func numberOfSections(in tableView: UITableView) -> Int {
    return dataSource.count
  }

  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return dataSource[section].title
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return dataSource[section].list.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let video = dataSource[indexPath.section].list[indexPath.row]
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
    let selectedSection = dataSource[indexPath.section]
    let selectedItem = selectedSection.list[indexPath.row]

    switch selectedSection.type {
    case .single:
      performSegue(withIdentifier: Self.segueSinglePlayerId, sender: selectedItem)
    case .multiple:
      performSegue(withIdentifier: Self.segueMultiPlayerId, sender: selectedItem)
    case .nowPlaying:
      performSegue(withIdentifier: Self.segueNowPlayingId, sender: selectedItem)
    }
  }
}

// MARK: - Navigation

extension ViewController {
  override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    if let playController = segue.destination as? PlayController {
      playController.video = sender as? VideoSingle
    }

    if let nowPlayingController = segue.destination as? NowPlayingController {
      nowPlayingController.video = sender as? VideoSingle
    }

    if let multiPlayerController = segue.destination as? MultiPlayerController {
      multiPlayerController.video = sender as? VideoMulti
    }
  }
}
