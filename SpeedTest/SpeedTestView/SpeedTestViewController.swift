import UIKit

final class SpeedTestViewController: UIViewController {

    private var uploadSpeedTimer: Timer?
    private var finalUploadSpeed: Int = 0
    
    //MARK: - main label
    private lazy var labelMain: UILabel = {
        let labelMain = UILabel()
        labelMain.text = "Speed Test"
        labelMain.textColor = .white
        labelMain.font = UIFont(name: "PathwayGothicOne-Regular", size: 32)
        labelMain.numberOfLines = 1
        labelMain.translatesAutoresizingMaskIntoConstraints = false
        return labelMain
    }()
    
    //MARK: - button start
    private lazy var buttonStart: UIButton = {
        let buttonStart = UIButton()
        buttonStart.backgroundColor = .clear
        buttonStart.layer.borderWidth = 2
        buttonStart.layer.cornerRadius = 4
        buttonStart.layer.borderColor = UIColor.white.cgColor
        buttonStart.setTitle("START", for: .normal)
        buttonStart.titleLabel?.font = UIFont(name: "PathwayGothicOne-Regular", size: 36)
        buttonStart.titleLabel?.textAlignment = .center
        buttonStart.setTitleColor(UIColor(red: 255/255, green: 255/255, blue: 255/255, alpha: 1), for: .normal)
        buttonStart.translatesAutoresizingMaskIntoConstraints = false
        buttonStart.addTarget(self, action: #selector(buttonTapped), for: .touchUpInside)
        return buttonStart
    }()
    
    //MARK: - background stars image
    private lazy var starsImage: UIImageView = {
        let image = UIImage(named: "starsImage")
        let starsImage = UIImageView(image: image)
        starsImage.translatesAutoresizingMaskIntoConstraints = false
        return starsImage
    }()
    
    //MARK: - span arc image with numbers in range of 0..200
    private lazy var spanImage: UIImageView = {
        let image = UIImage(named: "spanImage")
        let spanImage = UIImageView(image: image)
        spanImage.translatesAutoresizingMaskIntoConstraints = false
        return spanImage
    }()
    
    //MARK: - arrow image
    private lazy var arrowImage: UIImageView = {
        let image = UIImage(named: "arrow")
        let arrow = UIImageView(image: image)
        arrow.layer.anchorPoint = CGPoint(x: 1.0, y: 0.5)
        arrow.translatesAutoresizingMaskIntoConstraints = false
        return arrow
    }()

    //MARK: - span labels: ping, upload, download
    private lazy var spanLabelsImage: UIImageView = {
        let image = UIImage(named: "spanLabels")
        let spanLabels = UIImageView(image: image)
        spanLabels.translatesAutoresizingMaskIntoConstraints = false
        return spanLabels
    }()
    
    //MARK: - ping value label
    private lazy var labelPingValue: UILabel = {
        let labelPing = UILabel()
        labelPing.text = "--"
        labelPing.textColor = .white
        labelPing.font = UIFont(name: "PathwayGothicOne-Regular", size: 36)
        labelPing.numberOfLines = 1
        labelPing.translatesAutoresizingMaskIntoConstraints = false
        return labelPing
    }()

    //MARK: - upload value label
    private lazy var labelUploadValue: UILabel = {
        let labelUpload = UILabel()
        labelUpload.text = "--"
        labelUpload.textColor = .white
        labelUpload.font = UIFont(name: "PathwayGothicOne-Regular", size: 36)
        labelUpload.numberOfLines = 1
        labelUpload.translatesAutoresizingMaskIntoConstraints = false
        return labelUpload
    }()
    
    //MARK: - download value label
    private lazy var labelDownloadValue: UILabel = {
        let labelDownload = UILabel()
        labelDownload.text = "--"
        labelDownload.textColor = .white
        labelDownload.font = UIFont(name: "PathwayGothicOne-Regular", size: 36)
        labelDownload.numberOfLines = 1
        labelDownload.translatesAutoresizingMaskIntoConstraints = false
        return labelDownload
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupView()
    }
    
    //MARK: - setup view
    private func setupView() {
        view.backgroundColor = UIColor(red: 32/255, green: 7/255, blue: 63/255, alpha: 1)
        
        view.addSubview(labelMain)
        view.addSubview(buttonStart)
        view.addSubview(starsImage)
        view.addSubview(spanImage)
        view.addSubview(arrowImage)
        view.addSubview(spanLabelsImage)
        view.addSubview(labelPingValue)
        view.addSubview(labelUploadValue)
        view.addSubview(labelDownloadValue)
        
        ConstraintsManager.setupConstraints(forView: view, starsImage: starsImage, labelMain: labelMain, buttonStart: buttonStart, spanImage: spanImage, arrowImage: arrowImage, spanLabelsImage: spanLabelsImage, labelPingValue: labelPingValue, labelUploadValue: labelUploadValue, labelDownloadValue: labelDownloadValue)
    }
    
    @objc private func updateUploadSpeed() {
        
        let randomSpeed = Int.random(in: 0...200)
        
        // Update the label with the random speed
        labelUploadValue.text = "\(randomSpeed)"
        
        // Rotate the arrow image according to the random speed
        let rotationDegrees = CGFloat(randomSpeed) / 200 * 180
        let rotationRadians = rotationDegrees * .pi / 180
        
        // For a smoother rotation effect
        UIView.animate(withDuration: 0.1, delay: 0, options: .curveLinear, animations: {
            self.arrowImage.transform = CGAffineTransform(rotationAngle: rotationRadians)
        }, completion: nil)
    }
    
    @objc private func buttonTapped() {
        labelPingValue.text = "91"
        
        // Invalidate the timer if it is already running
        uploadSpeedTimer?.invalidate()
        
        // Start a new timer
        uploadSpeedTimer = Timer.scheduledTimer(timeInterval: 0.1, target: self, selector: #selector(updateUploadSpeed), userInfo: nil, repeats: true)
        
        // After 5 seconds stop the timer, update the final upload speed and sync the final arrow rotation
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            self.uploadSpeedTimer?.invalidate()
            self.uploadSpeedTimer = nil
            
            // Set the final upload speed
            self.finalUploadSpeed = Int.random(in: 0...200)
            self.labelUploadValue.text = "\(self.finalUploadSpeed)"
            
            // Final rotation of the arrow to match the final upload speed
            let finalRotationDegrees = CGFloat(self.finalUploadSpeed) / 200 * 180
            let finalRotationRadians = finalRotationDegrees * .pi / 180
            
            UIView.animate(withDuration: 0.1, animations: {
                self.arrowImage.transform = CGAffineTransform(rotationAngle: finalRotationRadians)
            })
        }
    }
}
