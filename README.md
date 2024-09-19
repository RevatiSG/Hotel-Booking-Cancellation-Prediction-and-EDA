# Hotel-Booking-Cancellation-Prediction-and-EDA
Decision Tree Analysis and Logistic Regression for predicting hotel booking cancellation.


## Project Overview
This project uses decision tree analysis to predict hotel booking cancellations based on various features. The analysis is performed using R and includes data preprocessing, model training, and evaluation.
## Dataset
The dataset booking.csv contains information about hotel bookings, including features such as:

- Number of adults and children
- Length of stay (weeknights and weekend nights)
- Type of meal plan
- Car parking space
- Room type
- Lead time
- Market segment type
- Repeated customer status
- Average price
- Special requests
- Year of reservation

## Requirements
To run this project, you'll need R and the following R packages:

rpart
rpart.plot

### You can install these packages using the following command in R:
```
install.packages('rpart.plot')
```
## Usage

Ensure the booking.csv file is in the correct directory.
Open the R script in your preferred R environment (e.g., RStudio).
Run the script to perform the analysis.

## Key Steps in the Analysis

- Data loading and preprocessing
- Feature engineering (e.g., extracting year from reservation date)
- Splitting data into training and test sets
- Building a decision tree model
- Visualizing the decision tree
- Making predictions on training and test sets
- Evaluating model performance (accuracy, error rate, TPR, TNR, FPR, FNR)

## Results
The script outputs various performance metrics for both the training and test sets, including:

- Confusion matrix
- Accuracy
- Error rate
- True Positive Rate (TPR)
- True Negative Rate (TNR)
- False Positive Rate (FPR)
- False Negative Rate (FNR)

## Future Work

- Feature importance analysis
- Hyperparameter tuning
- Comparison with other machine learning models

### Contributing
If you'd like to contribute to this project, please fork the repository and submit a pull request.
