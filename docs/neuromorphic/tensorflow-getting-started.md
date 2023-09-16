

## Resources for Getting Started

Many students use Deep Lizard with Keras and Tensorflow to get started: https://deeplizard.com/

For information about the concepts talked about in this section refer to: https://deeplizard.com/learn/video/YRhxdVk_sIs

## How do I use Tensorflow on CRNCH? 

https://www.tensorflow.org/install

1) Create a virtualenv and install with pip
   OR you could use a container with apptainer and TensorFlow Docker images
2) https://github.com/apptainer/apptainer-userdocs/blob/main/gpu.rst

## How do I checkpoint a training run?

This is important since GPU time is often limited for shared resources.

https://www.tensorflow.org/guide/checkpoint

## What is Keras?

Keras is a high level API that uses TensorFlow to run on the backend. Originally separated, Keras and TensorFlow were individual technologies but now Keras is integrated directly in the TensorFlow library.

## Getting Started with Keras
Given that Keras is included in the TensorFlow library, we first need to ensure TensorFlow is installed using the command: `pip install tensorflow` .

Once it is installed, we can use the following imports to start Keras and TensorFlow in our project:
```
import tensorflow
from tensorflow import keras
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Activation, Dense, BatchNormalization, Conv2D
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.metrics import categorical_crossentropy
from tensorflow.keras.preprocessing.image import ImageDataGenerator
```
Once imported, we can begin creating the neutral network and training it with our data.

## TensorFlow / Keras Tutorial - Medical Trial Side Effects

#### This is going to be a basic tutorial / explanation behind training a neural network and how to interpret the results.
#### This tutorial will be using a Jupyter notebook on CRNCH
#### Follow along here or on the DEEPLIZARD website which it is based on: https://deeplizard.com/learn/video/RznKVRTFkBY

### Step 1: Preprocessing Data for the Neural Network
For any neural network, we need to have a dataset to train it on. 

In this case, we will be using artificially creating this data using numpy arrays. These arrays will represent the people that did or didn't experience side effects in a medical trial and their respective ages.

Import the numpy libraries:
```
import numpy as np
from random import randint
from sklearn.utils import shuffle
from sklearn.preprocessing import MinMaxScaler
```
And create the two lists:
```
train_labels = []
train_samples = []
```
Now we can fill in the lists with our dummy data:
```
for i in range(50):
    # The ~5% of younger individuals who did experience side effects
    random_younger = randint(13,64)
    train_samples.append(random_younger)
    train_labels.append(1)

    # The ~5% of older individuals who did not experience side effects
    random_older = randint(65,100)
    train_samples.append(random_older)
    train_labels.append(0)

for i in range(1000):
    # The ~95% of younger individuals who did not experience side effects
    random_younger = randint(13,64)
    train_samples.append(random_younger)
    train_labels.append(0)

    # The ~95% of older individuals who did experience side effects
    random_older = randint(65,100)
    train_samples.append(random_older)
    train_labels.append(1)
```

Next, we need to change the arrays into numpy arrays, as this is was the `fit()` function used to train the neural network expects, as well as shuffling the values to make sure the order doesn't affect the training.
```
train_labels = np.array(train_labels)
train_samples = np.array(train_samples)
train_labels, train_samples = shuffle(train_labels, train_samples)
```
Finally, we need to normalize the data since inbalanced data can cause issues during training, such as slower training speed or inbalanced gradients.
```
scaler = MinMaxScaler(feature_range=(0,1))
scaled_train_samples = scaler.fit_transform(train_samples.reshape(-1,1))
```
### Step 2: Creating the Artificial Neural Network

Now that we have the data preprocessed for the neural network, we have to actually create network we will be training. 

First, we will import the libraries:
```
import tensorflow as tf
from tensorflow import keras
from tensorflow.keras.models import Sequential
from tensorflow.keras.layers import Activation, Dense
from tensorflow.keras.optimizers import Adam
from tensorflow.keras.metrics import categorical_crossentropy
```

And then begin creating our model:
```
model = Sequential([
    Dense(units=16, input_shape=(1,), activation='relu'),
    Dense(units=32, activation='relu'),
    Dense(units=2, activation='softmax')
])
```
The model we will be using is a sequential model. This means that the model is an array where each element is a layer of the neural network.

Looking at our model we can see that we have 3 layers:
- The first layer is the input layer. It has 16 nodes, an input shape of 1 (given that our input values are 1 dimensional) and an activation function of 'relu'.
- The second layer is just a regular 'dense' layer in the network. This layer has 32 nodes
- The final layer is our outpout layer. Here you'll notice how we have 2 nodes. These two nodes represent the output (the patient did or didn't have side effects).

Calling summary now, we can see how the model has been built:
<img src="..\figures\neuromorphic\model.summary.png" width="500">

### Step 3: Training the Model

Now that we have built the model and preprocessed the data we will be training it on, we can begin the actual training.

First we compile the model:
```
model.compile(optimizer=Adam(learning_rate=0.0001),loss='sparse_categorical_crossentropy', metrics=['accuracy'])
```

This uses the Adam optimizer (which is an extended stochastic gradient descent method) and sets the learning rate to 0.0001.

We also set the loss to be `sparse_categorical_crossentropy` and use accuracy as the metric for our model.

To train the model, we use the fit function:
```
model.fit(x=scaled_train_samples, y=train_labels, batch_size=10, epochs=30, verbose=2)
```

This function passes in the the training set, the corresponding labels of the sample data, the batch sizes, the amount of epochs we will be running, and verbose output.

Running the fit function, you should see something along these lines:

<img src="..\figures\neuromorphic\model.fit.png" width=500>

As you can see, the accuracy increases over the epochs and the loss decreases. Next, we will go over how to interpret these results and validate them.

### Step 4: Validating and Interpreting the results

We can further create a prediction set and run the model on it to predict whether or not a patient would receive a side effect.
```
test_labels =  []
test_samples = []

for i in range(10):
    # The 5% of younger individuals who did experience side effects
    random_younger = randint(13,64)
    test_samples.append(random_younger)
    test_labels.append(1)

    # The 5% of older individuals who did not experience side effects
    random_older = randint(65,100)
    test_samples.append(random_older)
    test_labels.append(0)

for i in range(200):
    # The 95% of younger individuals who did not experience side effects
    random_younger = randint(13,64)
    test_samples.append(random_younger)
    test_labels.append(0)

    # The 95% of older individuals who did experience side effects
    random_older = randint(65,100)
    test_samples.append(random_older)
    test_labels.append(1)

test_labels = np.array(test_labels)
test_samples = np.array(test_samples)
test_labels, test_samples = shuffle(test_labels, test_samples)

scaled_test_samples = scaler.fit_transform(test_samples.reshape(-1,1))
```
We can now run the predict method using our model and the new data set:
```
predictions = model.predict(
      x=scaled_test_samples
    , batch_size=10
    , verbose=0
)  
```
The `predictions` array now holds the probability of experiencing side effects and not experiencing side effects for each patient. Now we can compare the predictions with the actual labels and see how accurate our model was.

We first import the libraries we will be using:
```
%matplotlib inline
from sklearn.metrics import confusion_matrix
import itertools
import matplotlib.pyplot as plt
```
We then create the confusion matrix (which will allow us to visualize the predictions vs the actual results): 

`cm = confusion_matrix(y_true=test_labels, y_pred=rounded_predictions)`

Now we define the plot method for the confusion matrix:
```
def plot_confusion_matrix(cm, classes,
                        normalize=False,
                        title='Confusion matrix',
                        cmap=plt.cm.Blues):
    """
    This function prints and plots the confusion matrix.
    Normalization can be applied by setting `normalize=True`.
    """
    plt.imshow(cm, interpolation='nearest', cmap=cmap)
    plt.title(title)
    plt.colorbar()
    tick_marks = np.arange(len(classes))
    plt.xticks(tick_marks, classes, rotation=45)
    plt.yticks(tick_marks, classes)

    if normalize:
        cm = cm.astype('float') / cm.sum(axis=1)[:, np.newaxis]
        print("Normalized confusion matrix")
    else:
        print('Confusion matrix, without normalization')

    print(cm)

    thresh = cm.max() / 2.
    for i, j in itertools.product(range(cm.shape[0]), range(cm.shape[1])):
        plt.text(j, i, cm[i, j],
            horizontalalignment="center",
            color="white" if cm[i, j] > thresh else "black")

    plt.tight_layout()
    plt.ylabel('True label')
    plt.xlabel('Predicted label')
```

Finally, we create the labels and actually plot the matrix:
```
cm_plot_labels = ['no_side_effects','had_side_effects']
plot_confusion_matrix(cm=cm, classes=cm_plot_labels, title='Confusion Matrix')
```

You should now see an the matrix, similar to this:

<img src="..\figures\neuromorphic\confusion.matrix.png" width = 400>

Now out of the 420 patients we can see:
- 198 we predicted to not have side effects and did not actually have side effects
- 10 had side effects but were incorrectly predicted to not have side effects
- 12 did not have side effects but were predicted to have side effects
- 200 had side effects and were predicted to have side effects.

As you can see, our model did pretty good in terms of predicting the chances of side effects.

While this is a very elementary example of what TensorFlow and Keras can do, it should give you some context behind the process of using a Neural Network.