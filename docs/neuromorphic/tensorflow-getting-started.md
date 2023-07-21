

## Resources for Getting Started

Many students use Deep Lizard with Keras and Tensorflow to get started. 

## How do I use Tensorflow on CRNCH? 

https://www.tensorflow.org/install

1) Create a virtualenv and install with pip
   OR you could use a container with apptainer and TensorFlow Docker images
2) https://github.com/apptainer/apptainer-userdocs/blob/main/gpu.rst

## How do I checkpoint a training run?

This is important since GPU time is often limited for shared resources.

https://www.tensorflow.org/guide/checkpoint

## TensorFlow / Keras Tutorial - Medical Trial Side Effects

This is going to be a basic tutorial / explanation behind training a neural network and how to interpret the results.

This tutorial will be using a Jupyter notebook on CRNCH

Follow along here or on the DEEPLIZARD website which it is based on:
https://deeplizard.com/learn/video/RznKVRTFkBY

// In the deeplizard website they use an example with Keras.
They create numpy arrays that represent age ranges and their chances of having side effects of a medication. 

They create labels and then train the ANN on it. 

After it goes in depth about how to use a validation set, prediction set, and then how to read the results using a python graph visualizer.
