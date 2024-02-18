import UIKit

struct ConstraintsManager {
    
    static func setupConstraints(forView view: UIView, starsImage: UIImageView, labelMain: UILabel, buttonStart: UIButton, spanImage: UIImageView, arrowImage: UIImageView, spanLabelsImage: UIImageView, labelPingValue: UILabel, labelUploadValue: UILabel, labelDownloadValue: UILabel) {
        
        // Stars image constraints
        NSLayoutConstraint.activate([
            starsImage.topAnchor.constraint(equalTo: view.topAnchor),
            starsImage.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            starsImage.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            starsImage.bottomAnchor.constraint(equalTo: view.bottomAnchor)
        ])
        
        // Main label constraints
        NSLayoutConstraint.activate([
            labelMain.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            labelMain.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30)
        ])
        
        // Start button constraints
        NSLayoutConstraint.activate([
            buttonStart.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            buttonStart.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            buttonStart.widthAnchor.constraint(equalToConstant: 146),
            buttonStart.heightAnchor.constraint(equalToConstant: 48)
        ])
        
        // Span image constraints
        NSLayoutConstraint.activate([
            spanImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spanImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            spanImage.widthAnchor.constraint(equalToConstant: 344),
            spanImage.heightAnchor.constraint(equalToConstant: 180)
        ])
        
        // Arrow image constraints
        NSLayoutConstraint.activate([
            arrowImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            arrowImage.centerYAnchor.constraint(equalTo: spanImage.bottomAnchor, constant: -3),
        ])
        
        // Span labels image constraints
        NSLayoutConstraint.activate([
            spanLabelsImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            spanLabelsImage.centerYAnchor.constraint(equalTo: spanImage.bottomAnchor, constant: 24),
            spanLabelsImage.widthAnchor.constraint(equalToConstant: 258),
            spanLabelsImage.heightAnchor.constraint(equalToConstant: 14)
        ])
        
        // Label Ping Value constraints
        NSLayoutConstraint.activate([
            labelPingValue.leadingAnchor.constraint(equalTo: spanLabelsImage.leadingAnchor, constant: 3),
            labelPingValue.topAnchor.constraint(equalTo: spanLabelsImage.bottomAnchor, constant: 4),
        ])
        
        // Label Ping Value constraints
        NSLayoutConstraint.activate([
            labelDownloadValue.trailingAnchor.constraint(equalTo: spanLabelsImage.trailingAnchor, constant: -17),
            labelDownloadValue.topAnchor.constraint(equalTo: spanLabelsImage.bottomAnchor, constant: 4),
        ])
        
        // Label Upload Value constraints
        NSLayoutConstraint.activate([
            labelUploadValue.centerXAnchor.constraint(equalTo: spanLabelsImage.centerXAnchor, constant: -6),
            labelUploadValue.topAnchor.constraint(equalTo: spanLabelsImage.bottomAnchor, constant: 4),
        ])
        
    }
}
