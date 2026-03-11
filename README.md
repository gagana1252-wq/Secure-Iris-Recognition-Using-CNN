# Secure Iris Recognition using ResNet-50 (MATLAB)

## Project Overview
This project implements a **secure iris recognition system using deep learning**. The system uses the pretrained **ResNet-50 convolutional neural network** to extract unique iris features and perform identity classification. To improve security, biometric feature templates are encrypted before storage.

Iris recognition is one of the most reliable biometric identification techniques because iris patterns are highly unique and stable over time. By combining **deep learning feature extraction** with **template encryption**, this project demonstrates a secure biometric authentication system.

---

## Objectives
- Develop a deep learning based iris recognition system.
- Use **ResNet-50** for robust iris feature extraction.
- Implement **transfer learning in MATLAB**.
- Encrypt extracted iris features to improve biometric security.
- Evaluate recognition accuracy using classification metrics.

---

## Features
- Iris biometric authentication
- Deep feature extraction using ResNet-50
- Transfer learning implementation
- Iris template encryption
- Recognition accuracy evaluation
- Confusion matrix visualization

---

## Technologies Used
- MATLAB
- Deep Learning Toolbox
- Image Processing Toolbox
- ResNet-50 Pretrained Network
- Convolutional Neural Networks (CNN)

---

## System Architecture

The iris recognition system follows these steps:

1. Dataset Loading  
2. Image Preprocessing  
3. Image Resizing  
4. Deep Feature Extraction using ResNet-50  
5. Transfer Learning  
6. Feature Encryption  
7. Classification  
8. Performance Evaluation  

---

## Workflow

### 1. Dataset Preparation
The iris dataset is organized into folders where each folder represents a unique individual.

### 2. Image Preprocessing
Images are resized and converted to match the input requirements of the ResNet-50 network.

### 3. Transfer Learning
The pretrained ResNet-50 model is modified to classify iris images into different identity classes.

### 4. Feature Extraction
Deep features are extracted from the network’s **average pooling layer**.

### 5. Feature Encryption
The extracted iris feature vectors are encrypted to protect biometric templates.

### 6. Classification
The trained model predicts the identity of the iris image.

### 7. Performance Evaluation
The system calculates recognition accuracy and displays a confusion matrix.

---

## Dataset Structure

```
dataset/
│
├── person1
│   ├── iris1.png
│   ├── iris2.png
│
├── person2
│   ├── iris1.png
│   ├── iris2.png
```

Each folder represents a unique identity in the iris recognition system.

---

## Requirements

### Software
- MATLAB R2021 or later
- Deep Learning Toolbox
- Image Processing Toolbox

### Pretrained Network
- ResNet-50 Support Package

MATLAB will automatically prompt installation when the network is used if it is not already installed.

---

## How to Run the Project

1. Clone the repository.
2. Open MATLAB.
3. Set the dataset path correctly.
4. Run the main MATLAB script.
5. The system will train the model and display recognition accuracy.

---

## Output

The system produces the following outputs:

- Training progress graph
- Recognition accuracy
- Confusion matrix visualization
- Encrypted iris feature templates

---

## Applications

Secure iris recognition systems can be used in:

- Biometric authentication systems
- Secure access control
- Banking and financial security
- National identity verification
- Airport and border security

---

## Advantages of Iris Recognition

- Extremely high accuracy
- Unique and stable biometric pattern
- Difficult to forge or replicate
- Contactless authentication method

---

## Limitations

- Requires high-quality iris images
- Sensitive to eyelid occlusion and reflections
- Deep learning models require computational resources

---

## Future Improvements

Possible improvements include:

- Implement stronger encryption methods such as **AES or RSA**
- Develop a **real-time iris recognition system**
- Build a **graphical user interface (GUI)**
- Increase dataset size for better accuracy
- Deploy the system on **embedded or mobile platforms**

---

## Author

**Gagana M**  
Electronics and Communication Engineering

---

## License

This project is created for **educational and research purposes**.
