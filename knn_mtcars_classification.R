# Install the class package for K-Nearest Neighbors (KNN) algorithm
install.packages("class")
# Load the class package
library(class)
# Install the gmodels package for creating cross-tabulations (confusion matrix)
install.packages("gmodels")
# Load the gmodels package
library(gmodels)
# Install the caret package for machine learning utilities, such as data preprocessing
install.packages("caret")
# Load the caret package
library(caret)

# View the built-in 'mtcars' dataset to understand its structure
View(mtcars)
# Check the structure of the 'mtcars' dataset (types of variables, dimensions, etc.)
str(mtcars)
# Display the frequency table of the 'gear' variable in the 'mtcars' dataset
table(mtcars$gear)
# Display the frequency table of the 'cyl' variable in the 'mtcars' dataset
table(mtcars$cyl)

# Show the percentage distribution of the 'cyl' variable
round(prop.table(table(mtcars$cyl)) * 100, digits = 1)
# Provide summary statistics (mean, min, max, etc.) for each variable in the 'mtcars' dataset
summary(mtcars)
# Set seed to ensure reproducibility of results
set.seed(1234)
# Define a normalization function to scale values between 0 and 1
normalize <- function(x){(x - min(x)) / (max(x) - min(x))}

# Apply the normalization function to the first 11 columns of 'mtcars' dataset
xy <- as.data.frame(lapply(mtcars[1:11], normalize))
# Check summary statistics of the 'mpg' column after normalization
summary(xy$mpg)


# Split the normalized dataset into a training set (first 20 rows)
xy_train <- xy[1:20,]
# Split the normalized dataset into a testing set (remaining rows from 21 to 32)
xy_test <- xy[21:32,]
# Set the second column (cylinders) as the label for the training set
xy_train_labels <- xy[1:20, 2]
# Set the second column (cylinders) as the label for the test set
xy_test_labels <- xy[21:32, 2]

# Apply the KNN algorithm with k = 5 to classify the test set based on the training set
xy_test_pred <- knn(train = xy_train, test = xy_test, cl = xy_train_labels, k = 5)
# Display the predicted classifications for the test set
xy_test_pred
# Check the class type of the prediction object
class(xy_test_pred)

# Generate a cross-tabulation (confusion matrix) to compare predicted and actual test labels
CrossTable(x = xy_test_labels, y = xy_test_pred)
# Create a confusion matrix by comparing predicted and actual values
confusion_matrix <- table(xy_test_labels, xy_test_pred)
# Define a function to calculate classification accuracy
accuarcy <- function(x){(sum(diag(x)) / sum(rowSums(x))) * 100}
# Calculate the accuracy using the confusion matrix
accuracy_rate <- accuarcy(confusion_matrix)
# Display the accuracy rate
accuracy_rate

# Calculate the error rate as 100 - accuracy rate
error_rate <- 100 - accuracy_rate
# Display the error rate
error_rate
