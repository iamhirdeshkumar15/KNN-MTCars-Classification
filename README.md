# KNN Classification on MTCars Dataset

## Overview
This project demonstrates the application of the K-Nearest Neighbors (KNN) algorithm to classify the 'mtcars' dataset in R. The classification is performed based on the normalized features of the dataset, and the model's accuracy and error rate are calculated.

## Dataset
The 'mtcars' dataset is a built-in dataset in R, which includes various features such as miles per gallon (mpg), number of cylinders, horsepower, and others for 32 different car models.

## Packages Used
- `class` for KNN algorithm
- `gmodels` for confusion matrix (CrossTable)
- `caret` for machine learning utilities

## Code Details
- **Normalization**: Applied normalization to the dataset to bring all the values between 0 and 1.
- **Training and Testing Sets**: Used 90% of the data for training and 10% for testing.
- **KNN Algorithm**: The KNN algorithm with `k=5` was used to classify the test data based on the training data.
- **Accuracy and Error Rate**: The model's accuracy was calculated using a custom function and the error rate was computed as `100 - accuracy`.

## Usage
1. Clone the repository:
   ```bash
   git clone https://github.com/iamhirdeshkimar15/KNN-MTCars-Classification.git
