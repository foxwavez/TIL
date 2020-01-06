//
//  ViewController.swift
//  ImagePickerControllerExample
//
//  Created by giftbot on 2020. 1. 4..
//  Copyright © 2020년 giftbot. All rights reserved.
//

import UIKit
import MobileCoreServices
// 영상 찍을 때 소리 나오게 하혀면 위에 import를 해야한다

final class ViewController: UIViewController {

  @IBOutlet private weak var imageView: UIImageView!
  private let imagePicker = UIImagePickerController()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    imagePicker.delegate = self
  }
  
  @IBAction private func pickImage(_ sender: Any) {
    print("\n---------- [ pickImage ] ----------\n")
    
    imagePicker.sourceType = .photoLibrary
    // 기본값은 .photoLibrary / 특별한 순간은 .savedPhtoAlbum / 카메라는 .camera
    present(imagePicker, animated: true)
  }
  
  
  @IBAction private func takePicture(_ sender: Any) {
    print("\n---------- [ takePicture ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePicker.sourceType = .camera
    
    // [public.image]
//    print(imagePicker.mediaTypes)
//    present(imagePicker, animated: true)

    //[public.image, public.movie]
//    let mediaTypes = UIImagePickerController.availableMediaTypes(for: .camera)
//    imagePicker.mediaTypes = mediaTypes ?? []

//    imagePicker.mediaTypes = ["public.image"] // 일반적인 사용법, 실수 할 수 있다
    imagePicker.mediaTypes = [(kUTTypeImage as String), kUTTypeMovie as String] // 명확한 사용법 kuTTypeimame가 "public.image" 이런 형식으로 나타낸다
    
    present(imagePicker, animated: true)
    
  }
  
  @IBAction private func takePictureWithDelay(_ sender: Any) {
    print("\n---------- [ takePictureWithDelay ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePicker.sourceType = .camera
    imagePicker.mediaTypes = [kUTTypeImage as String]
    
    present(imagePicker, animated: true) {
//        self.imagePicker.takePicture() 바로 찍히게 하려면
        DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: { self.imagePicker.takePicture() }) // 2초 뒤에 딜레이 되서 알아서 찍힘
    }
  }
  
  
  @IBAction private func recordingVideo(_ sender: Any) {
    print("\n---------- [ recordingVideo ] ----------\n")
    guard UIImagePickerController.isSourceTypeAvailable(.camera) else { return }
    imagePicker.sourceType = .camera
     // movie - 소리포함 영상 / kuTTypeVideo - 영상만
    imagePicker.mediaTypes = [kUTTypeMovie as String] // "publuc.movie"
    imagePicker.cameraCaptureMode = .video
    imagePicker.videoQuality = .typeHigh
//    imagePicker.cameraDevice = .rear
    
    present(imagePicker, animated: true)
   
    
  }

  @IBAction private func toggleAllowsEditing(_ sender: Any) {
    print("\n---------- [ toggleAllowsEditing ] ----------\n")
    imagePicker.allowsEditing.toggle()
  }
}
// MARK: - UIImaePickerControllerDelegate

extension ViewController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        // cancle 메서드에서 할 작업이 없으면 생략
        // cancle 후 작업할 내용이 있으면 여기에 구현
        picker.dismiss(animated: true)
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        print("\n----------[didFinishPickingMediaWithInfo]---------\n")
        let mediaType = info[.mediaType] as! NSString
        if UTTypeEqual(mediaType, kUTTypeImage) {
            let originalImage = info[.originalImage] as! UIImage
            let editedImage = info[.editedImage] as? UIImage
            let selectedImage = editedImage ?? originalImage
            imageView.image = selectedImage
            
            if picker.sourceType == .camera {
                UIImageWriteToSavedPhotosAlbum(selectedImage, nil, nil, nil)
            }
        }
        else if UTTypeEqual(mediaType, kUTTypeMovie) {
            if let mediaPath = (info[.mediaURL] as? NSURL)?.path,
                UIVideoAtPathIsCompatibleWithSavedPhotosAlbum(mediaPath) {
                UISaveVideoAtPathToSavedPhotosAlbum(mediaPath, nil, nil, nil)
            }
        }
        picker.dismiss(animated: true)
    }
}
